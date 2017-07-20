<?php 
class ControllerModuleNilkanthinfoBlog extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/nilkanthinfo_blog');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
						
			$results = $this->model_extension_module->getModulesByCode('nilkanthinfo_blog');
			$total_module=sizeOf($results);
			if ($total_module==0) {
				$this->model_extension_module->addModule('nilkanthinfo_blog', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_top'] = $this->language->get('entry_top');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_image_blog_home'] = $this->language->get('entry_image_blog_home');
		$data['entry_image_blog_leftcolumn'] = $this->language->get('entry_image_blog_leftcolumn');
		$data['entry_image_blog_detail'] = $this->language->get('entry_image_blog_detail');
		$data['entry_image_blog_list'] = $this->language->get('entry_image_blog_list');
		
		$data['help_top'] = $this->language->get('help_top');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['image_blog_home'])) {
			$data['error_image_blog_home'] = $this->error['image_blog_home'];
		} else {
			$data['error_image_blog_home'] = '';
		}
		
		if (isset($this->error['image_blog_leftcolumn'])) {
			$data['error_image_blog_leftcolumn'] = $this->error['image_blog_leftcolumn'];
		} else {
			$data['error_image_blog_leftcolumn'] = '';
		}
		
		if (isset($this->error['image_blog_detail'])) {
			$data['error_image_blog_detail'] = $this->error['image_blog_detail'];
		} else {
			$data['error_image_blog_detail'] = '';
		}
		
		if (isset($this->error['image_blog_list'])) {
			$data['error_image_blog_list'] = $this->error['image_blog_list'];
		} else {
			$data['error_image_blog_list'] = '';
		}

		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/nilkanthinfo_blog', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/nilkanthinfo_blog', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/nilkanthinfo_blog', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/nilkanthinfo_blog', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		if (isset($this->request->post['top'])) {
			$data['top'] = $this->request->post['top'];
		} elseif (isset($module_info['top'])) {
			$data['top'] = $module_info['top'];
		} else {
			$data['top'] = 0;
		}
		
		if (isset($this->request->post['config_image_blog_home_width'])) {
			$data['config_image_blog_home_width'] = $this->request->post['config_image_blog_home_width'];
		} else  if (isset($module_info['config_image_blog_home_width'])) {
			$data['config_image_blog_home_width'] = $module_info['config_image_blog_home_width'];
		}

		if (isset($this->request->post['config_image_blog_home_height'])) {
			$data['config_image_blog_home_height'] = $this->request->post['config_image_blog_home_height'];
		} else if (isset($module_info['config_image_blog_home_height'])) {
			$data['config_image_blog_home_height'] = $module_info['config_image_blog_home_height'];
		}
		
		if (isset($this->request->post['config_image_blog_leftcolumn_width'])) {
			$data['config_image_blog_leftcolumn_width'] = $this->request->post['config_image_blog_leftcolumn_width'];
		} else if (isset($module_info['config_image_blog_leftcolumn_width'])) {
			$data['config_image_blog_leftcolumn_width'] = $module_info['config_image_blog_leftcolumn_width'];
		}

		if (isset($this->request->post['config_image_blog_leftcolumn_height'])) {
			$data['config_image_blog_leftcolumn_height'] = $this->request->post['config_image_blog_leftcolumn_height'];
		} else if (isset($module_info['config_image_blog_leftcolumn_height'])) {
			$data['config_image_blog_leftcolumn_height'] = $module_info['config_image_blog_leftcolumn_height'];
		}
		
		if (isset($this->request->post['config_image_blog_detail_width'])) {
			$data['config_image_blog_detail_width'] = $this->request->post['config_image_blog_detail_width'];
		} else if (isset($module_info['config_image_blog_detail_width'])) {
			$data['config_image_blog_detail_width'] = $module_info['config_image_blog_detail_width'];
		}

		if (isset($this->request->post['config_image_blog_detail_height'])) {
			$data['config_image_blog_detail_height'] = $this->request->post['config_image_blog_detail_height'];
		} else if (isset($module_info['config_image_blog_detail_height'])) {
			$data['config_image_blog_detail_height'] = $module_info['config_image_blog_detail_height'];
		}
		
		if (isset($this->request->post['config_image_blog_list_width'])) {
			$data['config_image_blog_list_width'] = $this->request->post['config_image_blog_list_width'];
		} else if (isset($module_info['config_image_blog_list_width'])) {
			$data['config_image_blog_list_width'] = $module_info['config_image_blog_list_width'];
		}

		if (isset($this->request->post['config_image_blog_list_height'])) {
			$data['config_image_blog_list_height'] = $this->request->post['config_image_blog_list_height'];
		} else if (isset($module_info['config_image_blog_list_height'])) {
			$data['config_image_blog_list_height'] = $module_info['config_image_blog_list_height'];
		}
		
			

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/nilkanthinfo_blog', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nilkanthinfo_blog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['config_image_blog_home_width'] || !$this->request->post['config_image_blog_home_height']) {
			$this->error['image_blog_home'] = $this->language->get('error_image_blog_home');
		}
		
		if (!$this->request->post['config_image_blog_leftcolumn_width'] || !$this->request->post['config_image_blog_leftcolumn_height']) {
			$this->error['image_blog_leftcolumn'] = $this->language->get('error_image_blog_leftcolumn');
		}
		
		if (!$this->request->post['config_image_blog_detail_width'] || !$this->request->post['config_image_blog_detail_height']) {
			$this->error['image_blog_detail'] = $this->language->get('error_image_blog_detail');
		}
		
		if (!$this->request->post['config_image_blog_list_width'] || !$this->request->post['config_image_blog_list_height']) {
			$this->error['image_blog_list'] = $this->language->get('error_image_blog_list');
		}

		return !$this->error;
	}
	
	public function install(){
	
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'nilkanthinfo/ni_blog' );
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/ni_blog' );
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'nilkanthinfo/ni_blog_comment' );
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/ni_blog_comment' );
		
		$this->load->model('nilkanthinfo/ni_blog');
        $this->model_nilkanthinfo_ni_blog->createDatabaseTables();
	}
	
	public function uninstall() {

		$this->load->model('user/user_group');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'nilkanthinfo/ni_blog' );
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/ni_blog' );
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'nilkanthinfo/ni_blog_comment' );
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/ni_blog_comment' );
		
        $this->load->model('nilkanthinfo/ni_blog');
        $this->model_nilkanthinfo_ni_blog->dropDatabaseTables();
    }
}
