<?php 
class ControllerModuleNilkanthinfoBlog extends Controller {
	public function index($setting) {
		$this->load->language('module/nilkanthinfo_blog');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['bloglink'] = $this->language->get('bloglink');
		$data['position']=$setting['position'];				//layout position of module by Nilkanthinfo

		$this->load->model('nilkanthinfo/nilkanthinfo_blog');
		
		$data['blogs']  = array();
		$data['text_more'] = $this->language->get('text_more');
      	$data['text_more2'] = $this->language->get('text_more2');
		$data['more'] = $this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id=' , true); 
		
		$data['total'] = $this->model_nilkanthinfo_nilkanthinfo_blog->getTotalBlogs();
		
		$data['image_home_width'] = $setting['config_image_blog_home_width'];
		$data['image_home_height'] = $setting['config_image_blog_home_height'];
		$data['image_leftcolumn_width'] = $setting['config_image_blog_leftcolumn_width'];
		$data['image_leftcolumn_height'] = $setting['config_image_blog_leftcolumn_height'];
		$data['image_detail_width'] = $setting['config_image_blog_detail_width'];
		$data['image_detail_height'] = $setting['config_image_blog_detail_height'];
		$data['image_list_width'] = $setting['config_image_blog_list_width'];
		$data['image_list_height'] = $setting['config_image_blog_list_height'];
		
		$results = $this->model_nilkanthinfo_nilkanthinfo_blog->getBlogs();
	
		foreach($results as $result){
			$comment=$this->model_nilkanthinfo_nilkanthinfo_blog->getTotalComments($result['blog_id']);
			$data['blogs'][]=array(
				'href' => $this->url->link('nilkanthinfo/nilkanthinfo_singleblog', 'blog_id=' . $result['blog_id']),			
				'blog_id' => $result['blog_id'],
				'image' 	=> $result['image'],
				'published_date' => $result['published_date'],
				'viewed'  => $result['viewed'],
				'blog_name' => $result['blog_name'],
				'description' => mb_substr(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'), 0,250 , 'UTF-8'). ' ' .'... <b><a href="'.$data['more']. $result['blog_id'] .'" title="'.$data['text_more2'].'">'. $data['text_more'] . '</a></b>',
				'tags' => $result['tags'],
				'comments' => $comment,
				'author' => $result['author'],
				'keyword' => $result['keyword']
			);
		}
		
		$data['allblog'] = $this->url->link('nilkanthinfo/nilkanthinfo_allblog', '', true); 	
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/module/nilkanthinfo_blog.tpl')) {
			 return $this->load->view('module/nilkanthinfo_blog', $data);
		} 		
	}
}