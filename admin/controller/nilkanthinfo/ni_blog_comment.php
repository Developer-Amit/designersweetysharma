<?php 
class ControllerNilkanthinfoNiBlogComment extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('nilkanthinfo/ni_blog_comment');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/ni_blog');

		$this->getList();
	}

	
	

	public function edit() {
		$this->language->load('nilkanthinfo/ni_blog_comment');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/ni_blog');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_nilkanthinfo_ni_blog->editComment($this->request->get['comment_id'], $this->request->post);

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

			$this->response->redirect($this->url->link('nilkanthinfo/ni_blog_comment', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('nilkanthinfo/ni_blog_comment');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/ni_blog');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $comment_id) {
				$this->model_nilkanthinfo_ni_blog->deleteComment($comment_id);
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

			$this->response->redirect($this->url->link('nilkanthinfo/ni_blog_comment', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'comment';
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
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('nilkanthinfo/ni_blog_comment', 'token=' . $this->session->data['token'] . $url, true)
		);

		
		$data['delete'] = $this->url->link('nilkanthinfo/ni_blog_comment/delete', 'token=' . $this->session->data['token'] . $url, true);
	
		$data['comments'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$comment_total = $this->model_nilkanthinfo_ni_blog->getTotalComments();

		$results = $this->model_nilkanthinfo_ni_blog->getComments($filter_data);
	
	
		foreach ($results as $result) {
			$data['comments'][] = array(
				'comment_id'  => $result['comment_id'],
				'comment'	  => $result['comment'],
				'blog_name'   => $result['blog_name'],
				'email_id'    => $result['email_id'],
				'created'     => $result['created'],
				'status'      => $result['status'],
				'edit'        => $this->url->link('nilkanthinfo/ni_blog_comment/edit', 'token=' . $this->session->data['token'] . '&comment_id=' . $result['comment_id'] . $url, true),
				'delete'      => $this->url->link('nilkanthinfo/ni_blog_comment/delete', 'token=' . $this->session->data['token'] . '&comment_id=' . $result['comment_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_comment'] = $this->language->get('column_comment');
		$data['column_blog_name'] = $this->language->get('column_blog_name');
		$data['column_email_id'] = $this->language->get('column_email_id');
		$data['column_created'] = $this->language->get('column_created');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');

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

		$data['sort_comment'] = $this->url->link('nilkanthinfo/ni_blog', 'token=' . $this->session->data['token'] . '&sort=comment' . $url, true);
		$data['sort_blog_name'] = $this->url->link('nilkanthinfo/ni_blog', 'token=' . $this->session->data['token'] . '&sort=blog_name' . $url, true);
		$data['sort_email_id'] = $this->url->link('nilkanthinfo/ni_blog', 'token=' . $this->session->data['token'] . '&sort=email_id' . $url, true);
		$data['sort_created'] = $this->url->link('nilkanthinfo/ni_blog', 'token=' . $this->session->data['token'] . '&sort=created' . $url, true);
		$data['sort_status'] = $this->url->link('nilkanthinfo/ni_blog', 'token=' . $this->session->data['token'] . '&sort=status' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $comment_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('nilkanthinfo/ni_blog', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($comment_total - $this->config->get('config_limit_admin'))) ? $comment_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $comment_total, ceil($comment_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('nilkanthinfo/ni_blog_comment_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['comment_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_user'] = $this->language->get('entry_user');
		$data['entry_blog'] = $this->language->get('entry_blog');
		$data['entry_email_id'] = $this->language->get('entry_email_id');
		$data['entry_created'] = $this->language->get('entry_created');
		$data['entry_status'] = $this->language->get('entry_status');
	

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		
		$data['blogs'] = $this->model_nilkanthinfo_ni_blog->getBlogs();
			
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['comment'])) {
			$data['error_comment'] = $this->error['comment'];
		} else {
			$data['error_comment'] = array();
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
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('nilkanthinfo/ni_blog_comment', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['comment_id'])) {
			$data['action'] = $this->url->link('nilkanthinfo/ni_blog_comment/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('nilkanthinfo/ni_blog_comment/edit', 'token=' . $this->session->data['token'] . '&comment_id=' . $this->request->get['comment_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('nilkanthinfo/ni_blog_comment', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['comment_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$comment_info = $this->model_nilkanthinfo_ni_blog->getComment($this->request->get['comment_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['comment_description'])) {
			$data['comment_description'] = $this->request->post['comment_description'];
		} elseif (isset($this->request->get['comment_id'])) {
			$data['comment_description'] = $this->model_nilkanthinfo_ni_blog->getCommentDescriptions($this->request->get['comment_id']);
		} else {
			$data['comment_description'] = array();
		}
		
		
		if (isset($this->request->post['created'])) {
			$data['created'] = $this->request->post['created'];
		} elseif (!empty($comment_info)) {
			$data['created'] = $comment_info['created'];
		} else {
			$data['created'] = '';
		}
		
		if (isset($this->request->post['blog_id'])) {
			$data['blog_id'] = $this->request->post['blog_id'];
		} elseif (!empty($comment_info)) {
			$data['blog_id'] = $comment_info['blog_id'];
		} else {
			$data['blog_id'] = '';
		}

		
		if (isset($this->request->post['email_id'])) {
			$data['email_id'] = $this->request->post['email_id'];
		} elseif (!empty($comment_info)) {
			$data['email_id'] = $comment_info['email_id'];
		} else {
			$data['email_id'] = '';
		}
		

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($comment_info)) {
			$data['status'] = $comment_info['status'];
		} else {
			$data['status'] = true;
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('nilkanthinfo/ni_blog_comment_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'nilkanthinfo/ni_blog_comment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['comment_description'] as $language_id => $value) {
			if ((utf8_strlen($value['comment']) < 2) || (utf8_strlen($value['comment']) > 255)) {
				$this->error['comment'][$language_id] = $this->language->get('error_comment');
			}
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'nilkanthinfo/ni_blog_comment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}