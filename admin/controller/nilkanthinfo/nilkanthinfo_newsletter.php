<?php  
class ControllerNilkanthinfoNilkanthinfoNewsletter extends Controller { 
	private $error = array();   
	
	protected function db_nilkanthinfo_newsletter_tbl_Check(){
		$query = $this->db->query("SHOW TABLES LIKE '".DB_PREFIX."nilkanthinfo_newsletter' ");
		if(!$query->num_rows){ 
			$this->db->query("CREATE TABLE ".DB_PREFIX."nilkanthinfo_newsletter (`nilkanthinfo_newsletter_id` int(11) NOT NULL AUTO_INCREMENT,  `email` varchar(100) NOT NULL, `status` int(3) NOT NULL,  PRIMARY KEY (`nilkanthinfo_newsletter_id`))");
		}
	} 
	
	public function index() {
		$this->db_nilkanthinfo_newsletter_tbl_Check();
  		
		$this->load->language('nilkanthinfo/nilkanthinfo_newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/nilkanthinfo_newsletter');

		$this->getList();
	}

	public function insert() {
		$this->load->language('nilkanthinfo/nilkanthinfo_newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/nilkanthinfo_newsletter');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_nilkanthinfo_nilkanthinfo_newsletter->addNewsletter($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('nilkanthinfo/nilkanthinfo_newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/nilkanthinfo_newsletter');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_nilkanthinfo_nilkanthinfo_newsletter->editNewsletter($this->request->get['nilkanthinfo_newsletter_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('nilkanthinfo/nilkanthinfo_newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/nilkanthinfo_newsletter');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $nilkanthinfo_newsletter_id) {
				$this->model_nilkanthinfo_nilkanthinfo_newsletter->deleteNewsletter($nilkanthinfo_newsletter_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'email';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
			'separator' => false
		);
                
             
		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . $url, true),
			'separator' => ' :: '
		);
 		
		$data['add'] = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter/insert', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter/delete', 'token=' . $this->session->data['token'] . $url, true);	

		$data['nilkanthinfo_newsletters'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$nilkanthinfo_newsletter_total = $this->model_nilkanthinfo_nilkanthinfo_newsletter->getTotalNewsletters();

		$results = $this->model_nilkanthinfo_nilkanthinfo_newsletter->getNewsletters($filter_data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('nilkanthinfo/nilkanthinfo_newsletter/update', 'token=' . $this->session->data['token'] . '&nilkanthinfo_newsletter_id=' . $result['nilkanthinfo_newsletter_id'] . $url, true)
			);
			
			$data['nilkanthinfo_newsletters'][] = array(
				'nilkanthinfo_newsletter_id' => $result['nilkanthinfo_newsletter_id'],
				'email'            => $result['email'],
 				'status'      => $result['status'],
				'selected'        => isset($this->request->post['selected']) && in_array($result['nilkanthinfo_newsletter_id'], $this->request->post['selected']),
				'action'          => $action
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_email'] = $this->language->get('column_email');
		$data['column_status'] = $this->language->get('column_status');
 		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_email'] = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . '&sort=email' . $url, true);
 		$data['sort_status'] = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . '&sort=statys' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $nilkanthinfo_newsletter_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();
		$data['sort'] = $sort;
		$data['order'] = $order;
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('nilkanthinfo/nilkanthinfo_newsletter_list', $data));
		
		
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_form'] = !isset($this->request->get['nilkanthinfo_newsletter_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_default'] = $this->language->get('text_default');
 
		$data['entry_email'] = $this->language->get('entry_email');
  		$data['entry_status'] = $this->language->get('entry_status');
   
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['tab_general'] = $this->language->get('tab_general');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		} 
		 
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . $url, true),
			'separator' => ' :: '
		);
		
		if (!isset($this->request->get['nilkanthinfo_newsletter_id'])) {
			$data['action'] = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter/insert', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter/update', 'token=' . $this->session->data['token'] . '&nilkanthinfo_newsletter_id=' . $this->request->get['nilkanthinfo_newsletter_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('nilkanthinfo/nilkanthinfo_newsletter', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['nilkanthinfo_newsletter_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$nilkanthinfo_newsletter_info = $this->model_nilkanthinfo_nilkanthinfo_newsletter->getNewsletter($this->request->get['nilkanthinfo_newsletter_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($nilkanthinfo_newsletter_info)) {
			$data['email'] = $nilkanthinfo_newsletter_info['email'];
		} else {
			$data['email'] = '';
		}
 		  
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($nilkanthinfo_newsletter_info)) {
			$data['status'] = $nilkanthinfo_newsletter_info['status'];
		} else {
			$data['status'] = '';
		}
		
			$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('nilkanthinfo/nilkanthinfo_newsletter_form', $data));
		
		
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'nilkanthinfo/nilkanthinfo_newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}
  		
		return !$this->error;
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'nilkanthinfo/nilkanthinfo_newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}  
	}
}