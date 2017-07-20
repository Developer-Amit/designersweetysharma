<?php
class ControllerModuleNilkanthInfoTestimonial extends Controller {
	private $error = array(); 

	public function index() {   
		$this->load->language('module/nilkanthinfo_testimonial');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('nilkanthinfo_testimonial', $this->request->post);
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
		
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_bedwords'] = $this->language->get('entry_bedwords');
	
		$data['entry_status'] = $this->language->get('entry_status');
	
		$data['entry_badwords'] = $this->language->get('entry_badwords');
		$data['entry_blockedip'] = $this->language->get('entry_blockedip');
		
		$data['entry_dimension'] = $this->language->get('entry_dimension');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		
		$data['entry_character_limit'] = $this->language->get('entry_character_limit');
		$data['entry_admin_approved'] = $this->language->get('entry_admin_approved');
		$data['entry_default_rating'] = $this->language->get('entry_default_rating');
		$data['entry_good'] = $this->language->get('entry_good');
		$data['entry_bad'] = $this->language->get('entry_bad');
		$data['entry_random'] = $this->language->get('entry_random');
		$data['entry_send_to_admin'] = $this->language->get('entry_send_to_admin');
		$data['entry_all_page_limit'] = $this->language->get('entry_all_page_limit');
		
		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');
	
		$data['text_required_field'] = $this->language->get('text_required_field');
		$data['text_help'] = $this->language->get('text_help');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['text_edit_testimonials'] = $this->language->get('text_edit_testimonials');

		$data['tab_module'] = $this->language->get('tab_module');
	
		$data['text_left'] = $this->language->get('text_left');
		$data['text_right'] = $this->language->get('text_right');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');


		if (isset($this->request->post['testimonial_title'])) {
			$data['testimonial_title'] = $this->request->post['testimonial_title'];
		} else {
			$data['testimonial_title'] = $this->config->get('testimonial_title');
		}

		if (isset($this->request->post['nilkanthinfo_testimonial_module'])) {
			$data['modules'] = $this->request->post['nilkanthinfo_testimonial_module'];
		} elseif ($this->config->get('nilkanthinfo_testimonial_module')) { 
			$data['modules'] = $this->config->get('nilkanthinfo_testimonial_module');
		
		}
				
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

	

  		
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'], true),
			'separator' => ' :: '
		);
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('module/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
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
	
		$data['edit_testimonials_path'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'], true);

		$data['modules'] = array();
		
	

			if (isset($this->request->post['testimonial_admin_approved'])) {
			$data['testimonial_admin_approved'] = $this->request->post['testimonial_admin_approved'];
		} elseif (isset($module_info) && array_key_exists("testimonial_admin_approved",$module_info)) {
			$data['testimonial_admin_approved'] = $module_info['testimonial_admin_approved'];
		}
		

		if (isset($this->request->post['testimonial_send_to_admin'])) {
			$data['testimonial_send_to_admin'] = $this->request->post['testimonial_send_to_admin'];
		} elseif (isset($module_info) && array_key_exists("testimonial_send_to_admin",$module_info)) {
			$data['testimonial_send_to_admin'] = $module_info['testimonial_send_to_admin'];
		}

		

		if (isset($this->request->post['testimonial_default_rating'])) {
			$data['testimonial_default_rating'] = $this->request->post['testimonial_default_rating'];
		} elseif (!empty($module_info)) {
			$data['testimonial_default_rating'] = $module_info['testimonial_default_rating'];
		}
		else
		{
				$data['testimonial_default_rating'] ='';
		}
		
	


	
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 5;
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 200;
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 200;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

	

		$this->response->setOutput($this->load->view('module/nilkanthinfo_testimonial', $data));

		
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nilkanthinfo_testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
	
	public function install() {
		$this->load->model('user/user_group');
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'nilkanthinfo/nilkanthinfo_testimonial' );
		$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/nilkanthinfo_testimonial' );
		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');
		$this->model_nilkanthinfo_nilkanthinfo_testimonial->createDatabaseTables();
	}

	public function uninstall() {
		$this->load->model('user/user_group');
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'access', 'nilkanthinfo/nilkanthinfo_testimonial' );
		$this->model_user_user_group->removePermission($this->user->getGroupId(), 'modify', 'nilkanthinfo/nilkanthinfo_testimonial' );

		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');
		$this->model_nilkanthinfo_nilkanthinfo_testimonial->dropDatabaseTables();
	}
}
?>