<?php 

class ControllerNilkanthinfoNilkanthinfoAllblog extends Controller {
		    
  	public function index() {
		$this->load->language('nilkanthinfo/nilkanthinfo_allblog');
		$data['heading_title'] = $this->language->get('heading_title');
		$this->document->SetTitle ($this->language->get('heading_title'));

		$this->load->model('nilkanthinfo/nilkanthinfo_blog');
		
		//Breadcrumb
		$data['breadcrumbs'] = array();

      	$data['breadcrumbs'][] = array(
	        	'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', '', true),
	        	'separator' => false
      	);

      	$data['breadcrumbs'][] = array(
	        	'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('nilkanthinfo/nilkanthinfo_allblog','', true),
	        	'separator' => $this->language->get('text_separator')
      	);	
		//End Breadcrumb	
			
		//Blog Data	
		$blog_total = $this->model_nilkanthinfo_nilkanthinfo_blog->getTotalBlogs();
		
		
		$data['blogs'] = array();
		$data['text_more'] = $this->language->get('text_more');
      	$data['text_more2'] = $this->language->get('text_more2');
		$data['more'] = $this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id=' , true);

		$results = $this->model_nilkanthinfo_nilkanthinfo_blog->getAllBlog();
		
		
 	
		foreach($results as $result){
			$data['blogs'][]=array(
				'blog_name' => $result['blog_name'],
				'image' 	=> $result['image'],
				// 'description' => mb_substr(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'), 0,500 , 'UTF-8'). ' ' .'... <b><a href="'.$data['more']. $result['blog_id'] .'" title="'.$data['text_more2'].'">'. $data['text_more'] . '</a></b>',
				'description' => mb_substr(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'), 0,500 , 'UTF-8'),
				'tags' => $result['tags'],
				'author' => $result['author'],
				'keyword' => $result['keyword'],
				'published_date' => $result['published_date'],
				'viewed' => $result['viewed'],
				'total_comment' => $this->model_nilkanthinfo_nilkanthinfo_blog->getTotalComments($result['blog_id']),
				'href' => 	$this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id='.$result['blog_id'], true)
			);
		}
		//End Blog Data
		
		
		//Pagination
		$this->page_limit =100;
			
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
		
		$url = '';
	
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $blog_total;
		$pagination->page = $page;
		$pagination->limit = $this->page_limit; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('nilkanthinfo/nilkanthinfo_allblog', '&page={page}', true);
		$data['pagination'] = $pagination->render();	
		//End Pagination
			

		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		
				
		$this->response->setOutput($this->load->view('nilkanthinfo/nilkanthinfo_allblog', $data));
		

  	}

}
?>
