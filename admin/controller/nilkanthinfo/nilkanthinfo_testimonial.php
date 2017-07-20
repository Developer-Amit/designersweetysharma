<?php
class ControllerNilkanthinfoNilkanthInfoTestimonial extends Controller { 
	private $error = array();
	
	public function index() {
		$this->load->language('nilkanthinfo/nilkanthinfo_testimonial');

		$this->document->setTitle($this->language->get('heading_title'));
		 
		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');

		$this->getList();
	}

	public function insert() {
		$this->load->language('nilkanthinfo/nilkanthinfo_testimonial');

		$this->document->SetTitle($this->language->get('heading_title'));
		
		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');
	
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$this->model_nilkanthinfo_nilkanthinfo_testimonial->addtestimonial($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->response->redirect($this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token']. $url, true));
		}

		$this->getForm();
	}

	public function update() {
		$this->load->language('nilkanthinfo/nilkanthinfo_testimonial');

		$this->document->SetTitle( $this->language->get('heading_title') );
		
		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');
		
	
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		
			$this->model_nilkanthinfo_nilkanthinfo_testimonial->edittestimonial($this->request->get['testimonial_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->response->redirect($this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token']. $url, true));

		}

		$this->getForm();
	}
 
	public function delete() {
		$this->load->language('nilkanthinfo/nilkanthinfo_testimonial');

		$this->document->SetTitle( $this->language->get('heading_title'));
		
		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $testimonial_id) {
				$this->model_nilkanthinfo_nilkanthinfo_testimonial->deletetestimonial($testimonial_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->response->redirect($this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token']. $url, true));

		}

		$this->getList();
	}


	
	private function getList() {
	
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 't.date_added';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}



		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true),
      		'separator' => false
   		);

   		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . $url, true),
      		'separator' => ' :: '
   		);
		
	
				
							
		$data['add'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial/insert', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial/delete', 'token=' . $this->session->data['token'] . $url, true);	
		$data['module_settings_path'] = $this->url->link('module/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . $url, true);	
		$data['text_module_settings'] = $this->language->get('text_module_settings');


		$data['testimonials'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * 10,
			'limit' => 10
		);
		
			$this->load->model('tool/image');
			
		$testimonial_total = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getTotalTestimonials();
		$data['testimonial_total'] = $testimonial_total;
		
	
		
		$results = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getTestimonials($filter_data);
		
		/*if ($testimonial_total!=-1)
			$results = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getTestimonials($filter_data);
 		else
		{
			$results = array();
			$testimonial_total = 0;
		}*/


    		foreach ($results as $result) {
					
					
					
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}	

					$result['description'] = strip_tags(html_entity_decode($result['description']));

			//$lim = 50;
			//if (mb_strlen($result['description'],'UTF-8')>$lim) $result['description'] = mb_substr($result['description'], 0, $lim-3, 'UTF-8').'...';

	
								$data['testimonials'][] = array(
						'testimonial_id' => $result['testimonial_id'],
						'image'      => $image,
						'name'		=> $result['name'],
						'description'	=> $result['description'],
						'city'		=> $result['city'],
						'title'      	=> $result['title'],
						'date_added' 	=> $result['date_added'],
						'status' 		=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
						'selected'   	=> isset($this->request->post['selected']) && in_array($result['testimonial_id'], $this->request->post['selected']),
						'edit'        => $this->url->link('nilkanthinfo/nilkanthinfo_testimonial/update', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $result['testimonial_id'] . $url, true),
						'delete'      => $this->url->link('nilkanthinfo/nilkanthinfo_testimonial/delete', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $result['testimonial_id'] . $url, true)
						
					);
					

					}
					

	
		$data['heading_title'] = $this->language->get('heading_title');
	
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_title'] = $this->language->get('column_title');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_image'] = $this->language->get('column_image');

		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');		
		$data['column_name'] = $this->language->get('column_name');		
		$data['column_city'] = $this->language->get('column_city');
		$data['button_insert'] = $this->language->get('button_insert');
		
		
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');
		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}
			
		$data['entry_install_first'] = $this->language->get('entry_install_first');;

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

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=' .  'DESC';
		} else {
			$url .= '&order=' .  'ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['sort_title'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . '&sort=td.title' . $url, true);
		$data['sort_date_added'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . '&sort=t.date_added' . $url, true);		
		$data['sort_status'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . '&sort=t.status' . $url, true);		
		$data['sort_name'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . '&sort=t.name' . $url, true);		
		$data['sort_description'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . '&sort=td.description' . $url, true);		
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $testimonial_total;
		$pagination->page = $page;
		$pagination->limit = 10; 
		$pagination->text = $this->language->get('text_pagination');
		
		$pagination->url = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);		
			
		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($testimonial_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($testimonial_total - $this->config->get('config_limit_admin'))) ? $testimonial_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $testimonial_total, ceil($testimonial_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		
		
		$this->response->setOutput($this->load->view('nilkanthinfo/nilkanthinfo_testimonial_list', $data));
		
	}

	private function getForm() {
	
		
		$data['heading_title'] = $this->language->get('heading_title');
			$data['text_none'] = $this->language->get('text_none');

		$data['text_form'] = !isset($this->request->get['testimonial_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_city'] = $this->language->get('entry_city');
			$data['entry_image'] = $this->language->get('entry_image');
			$data['entry_parent'] = $this->language->get('entry_parent');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_testimonial'] = $this->language->get('entry_testimonial');

		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_bad'] = $this->language->get('entry_bad');
		$data['entry_good'] = $this->language->get('entry_good');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}
		
	 	if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = '';
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
			'href'      => $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . $url, true),
      		'separator' => ' :: '
   		);

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
							
		if (!isset($this->request->get['testimonial_id'])) {
			$data['action'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial/insert', 'token=' . $this->session->data['token'] . $url, true);		
		} else {
			$data['action'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial/update', 'token=' . $this->session->data['token'] . '&testimonial_id=' . $this->request->get['testimonial_id'] . $url, true);
		}
		
		$data['cancel'] = $this->url->link('nilkanthinfo/nilkanthinfo_testimonial', 'token=' . $this->session->data['token'] . $url, true);

		$data['token'] = $this->session->data['token'];
		
		if (isset($this->request->get['testimonial_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$testimonial_info = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getTestimonial($this->request->get['testimonial_id']);
		}
		
		
	
		
		
		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');

		$data['parenttestimonials'] = array();

		if (isset($this->request->post['testi'])) {
			$parenttestimonials = $this->request->post['testi'];
		} elseif (!empty($module_info)) {
			$parenttestimonials = $module_info['testi'];
		} else {
			$parenttestimonials = array();
		}

		foreach ($parenttestimonials as $parenttestimonials_id) {
			$parenttestimonials_info = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getTestimonials($parenttestimonials_id);

			if ($parenttestimonials_info) {
				$data['parenttestimonials'][] = array(
					'testimonial_id' => $parenttestimonials_info['testimonial_id'],
					'title'       => $parenttestimonials_info['title']
				);
			}
		}
		
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['testimonial_description'])) {
			$data['testimonial_description'] = $this->request->post['testimonial_description'];
		} elseif (isset($this->request->get['testimonial_id'])) {
			$data['testimonial_description'] = $this->model_nilkanthinfo_nilkanthinfo_testimonial->gettestimonialDescriptions($this->request->get['testimonial_id']);
		} else {
			$data['testimonial_description'] = array();
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($testimonial_info)) {
			$data['status'] = $testimonial_info['status'];
		} else {
			$data['status'] = 1;
		}
		
	if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($testimonial_info)) {
			$data['image'] = $testimonial_info['image'];
		} else {
			$data['image'] = '11';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($testimonial_info) && is_file(DIR_IMAGE . $testimonial_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($testimonial_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (isset($testimonial_info)) {
			$data['name'] = $testimonial_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (isset($testimonial_info)) {
			$data['city'] = $testimonial_info['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (isset($testimonial_info)) {
			$data['email'] = $testimonial_info['email'];
		} else {
			$data['email'] = '';
		}

		
		if (isset($this->request->post['date_added'])) {
			$data['date_added'] = $this->request->post['date_added'];
		}elseif (isset($testimonial_info)) {
			$data['date_added'] = $testimonial_info['date_added'];
		}else {
		
			$data['date_added'] = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getCurrentDateTime();
		
			
		}
		
	
		

		if (isset($this->request->post['rating'])) {
			$data['rating'] = $this->request->post['rating'];
		} elseif (isset($testimonial_info)) {
			$data['rating'] = $testimonial_info['rating'];
		} else {

		
				$data['rating'] = '3';
		

		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('nilkanthinfo/nilkanthinfo_testimonial_form', $data));
		
		

	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'nilkanthinfo/nilkanthinfo_testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}


		foreach ($this->request->post['testimonial_description'] as $language_id => $value) {
			if (strlen(utf8_decode($value['description'])) != 0) {
				$this->request->post['testimonial_description'][$language_id]['description'] = (html_entity_decode($value['description']));
			}		
		}


		$desc = '';
		foreach ($this->request->post['testimonial_description'] as $language_id => $value) {
			if (strlen(utf8_decode($value['description'])) != 0) {
				$desc = $value['description'];
				break;
			}		
		}

		if ($desc == '')
		{
			foreach ($this->request->post['testimonial_description'] as $language_id => $value) {
					$this->error['description'][$language_id] = $this->language->get('error_description');
			}
		}
		else
		{
			foreach ($this->request->post['testimonial_description'] as $language_id => $value) {
				if (strlen(utf8_decode($value['description'])) == 0) $this->request->post['testimonial_description'][$language_id]['description'] = $desc;
			}
		}


		return !$this->error;
	}

	private function validateDelete() {

		if (!$this->user->hasPermission('modify', 'nilkanthinfo/nilkanthinfo_testimonial')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
?>