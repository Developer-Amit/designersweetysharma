<?php 

 
class ControllerNilkanthinfoNilkanthinfoSingleblog extends Controller {
	private $error = array(); 

	

	    
  	public function index() {
		$this->load->language('nilkanthinfo/nilkanthinfo_singleblog');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_send'] = $this->language->get('button_send');
			$data['error_user'] = $this->language->get('error_user');
			$data['error_comment'] = $this->language->get('error_comment');
			$data['error_email'] = $this->language->get('error_email');
	    	$data['error_captcha'] = $this->language->get('error_captcha');
		

		$this->load->model('nilkanthinfo/nilkanthinfo_blog');
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			$data['data']=array();
			$data['data']['blog_id'] = strip_tags(html_entity_decode($this->request->post['blog_id']));
			$data['data']['email'] = strip_tags(html_entity_decode($this->request->post['email']));
			$data['data']['user'] = strip_tags(html_entity_decode($this->request->post['user']));
			$data['data']['newcomment'] = strip_tags(html_entity_decode($this->request->post['newcomment']));


		

			$this->model_nilkanthinfo_nilkanthinfo_blog->addComment($data['data'], 1);
			
			$this->session->data['success'] = $this->language->get('text_add');
			
			$data['newcomment'] = '';
			$this->request->post[] = array();
			$this->response->redirect($this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id='.$this->request->get['blog_id'], true));

			
		}
			
		
		$data['blogs'] = array();
		$results = $this->model_nilkanthinfo_nilkanthinfo_blog->getBlog($this->request->get['blog_id']);
 	
		foreach($results as $result){
			$data['heading_title'] = $result['blog_name'];
			$data['blogs'][]=array(
				'blog_name' => $result['blog_name'],
				'image' 	=> $result['image'],
				'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
				'tags' => $result['tags'],
				'author' => $result['author'],
				'keyword' => $result['keyword'],
				'published_date' => $result['published_date'],
				'viewed' => $result['viewed'],
				'total_comment' => $this->model_nilkanthinfo_nilkanthinfo_blog->getTotalComments($result['blog_id']),
				$this->document->setTitle($result['tags']),
				$this->document->setDescription($result['meta_tag_description']),
				$this->document->setKeywords($result['meta_tag_keyword'])	
			);
		}
		
		$data['comments'] = array();
		
		$comms = $this->model_nilkanthinfo_nilkanthinfo_blog->getComments($this->request->get['blog_id']);
	
		foreach($comms as $comm){
			$data['comments'][]=array(
				'user' => $comm['user'],
				'created' => $comm['created'],
				'comment' => $comm['comment']
			);
		}
		
		
	
      	$data['breadcrumbs'] = array();

      	$data['breadcrumbs'][] = array(
	        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', '', true),
	        	'separator' => false
      	);

      	$data['breadcrumbs'][] = array(
	        	'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id='.$this->request->get['blog_id'], true),
	        	'separator' => $this->language->get('text_separator')
      	);			

	    	$data['entry_user'] = $this->language->get('entry_user');
			$data['entry_newcomment'] = $this->language->get('entry_newcomment');
			$data['entry_email'] = $this->language->get('entry_email');
	    	$data['entry_captcha'] = $this->language->get('entry_captcha');
	


	
		if (isset($this->error['user'])) {
    		$data['error_user'] = $this->error['user'];
		} else {
			$data['error_user'] = '';
		}
		
		if (isset($this->error['comment'])) {
    		$data['error_comment'] = $this->error['comment'];
		} else {
			$data['error_comment'] = '';
		}
		
		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}		
			
		if (isset($this->error['captcha'])) {
			$data['error_captcha'] = $this->error['captcha'];
		} else {
			$data['error_captcha'] = '';
		}

    		$data['button_continue'] = $this->language->get('button_continue');
    
    		$data['action'] = $this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id='.$this->request->get['blog_id'], true);

		
	


		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}
		if (isset($this->request->post['user'])) {
			$data['user'] = $this->request->post['user'];
		} else {
			$data['user'] = '';
		}
		
		if (isset($this->request->post['newcomment'])) {
			$data['newcomment'] = $this->request->post['newcomment'];
		} else {
			$data['newcomment'] = '';
		}
		
		$this->load->model('extension/module');
		$setting='';		
		
				
		if (isset($this->request->post['captcha'])) {
			$data['captcha'] = $this->request->post['captcha'];
		} else {
			$data['captcha'] = '';
		}		
	
			
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('nilkanthinfo/nilkanthinfo_singleblog', $data));
		
  	}

  	

	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}
	
  	private function validate() {

	    	if ((strlen(utf8_decode($this->request->post['newcomment'])) < 2) || (strlen(utf8_decode($this->request->post['newcomment'])) > 255)) {
	      		$this->error['comment'] = $this->language->get('error_comment');
	    	}
	
	    	if (!isset($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
	      		$this->error['captcha'] = $this->language->get('error_captcha');
	    	}
			
			if (!isset($this->session->data['captcha']) || (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) ){
				$this->error['email'] = $this->language->get('error_email');
			}
		
		if (!$this->error) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}  	  
  	}
}
?>
