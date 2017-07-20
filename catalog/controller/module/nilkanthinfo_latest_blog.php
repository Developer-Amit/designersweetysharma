<?php 
class ControllerModuleNilkanthinfoLatestBlog extends Controller {
	public function index($setting) {
		$this->load->language('module/nilkanthinfo_latest_blog');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['bloglink'] = $this->language->get('bloglink');
		$data['position']=$setting['position'];				//layout position of module by Nilkanthinfo

		$this->load->model('nilkanthinfo/nilkanthinfo_blog');
		
		$data['blogs']  = array();
		$data['text_more'] = $this->language->get('text_more');
      	$data['text_more2'] = $this->language->get('text_more2');
		$data['more'] = $this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id=' , true);
		
		//$data['total'] = $this->model_nilkanthinfo_nilkanthinfo_blog->getTotalBlogs();
		
		$results = $this->model_nilkanthinfo_nilkanthinfo_blog->getLatestBlogs($setting['limit']);
	
		foreach($results as $result){
			$comment=$this->model_nilkanthinfo_nilkanthinfo_blog->getTotalComments($result['blog_id']);
			$data['blogs'][]=array(
				'href' => $this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id=' . $result['blog_id']),			
				'blog_id' => $result['blog_id'],
				'image' 	=> $result['image'],
				'published_date' => $result['published_date'],
				'viewed'  => $result['viewed'],
				'blog_name' => $result['blog_name'],
				'description' => mb_substr(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'), 0,250 , 'UTF-8'),
				'tags' => $result['tags'],
				'comments' => $comment,
				'author' => $result['author'],
				'keyword' => $result['keyword']
			);
		}
		
		$data['allblog'] = $this->url->link('nilkanthinfo/nilkanthinfo_allblog', '', true); 	
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/module/nilkanthinfo_latest_blog.tpl')) {
			 return $this->load->view('module/nilkanthinfo_latest_blog', $data);
		} 		
	}
}