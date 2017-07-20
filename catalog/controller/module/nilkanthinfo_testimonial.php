<?php  
class ControllerModuleNilkanthinfoTestimonial extends Controller {

	public function index($setting) {
			static $module = 0;
		$this->load->language('module/nilkanthinfo_testimonial');
		
	

		$data['name'] = html_entity_decode($setting['name'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');

      	$data['heading_title'] = $this->language->get('heading_title');
      	$data['text_more'] = $this->language->get('text_more');
      	$data['text_more2'] = $this->language->get('text_more2');
		$data['isi_testimonial'] = $this->language->get('isi_testimonial');
		$data['show_all'] = $this->language->get('show_all');
		$data['showall_url'] = $this->url->link('nilkanthinfo/nilkanthinfo_alltestimonial', '', true); 
		$data['more'] = $this->url->link('nilkanthinfo/nilkanthinfo_alltestimonial', 'testimonial_id=' , true); 
		$data['isitesti'] = $this->url->link('nilkanthinfo/nilkanthinfo_isitestimonial', '', true);
		$data['templatepath']=$this->config->get('theme_default_directory');

		$this->load->model('nilkanthinfo/nilkanthinfo_testimonial');
		
		$data['testimonials'] = array();
		
		$data['total'] = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getTotalTestimonials();
		$results = $this->model_nilkanthinfo_nilkanthinfo_testimonial->getTestimonials(0, $setting['limit'], (isset($setting['testimonial_random']))?true:false);
	
	

		foreach ($results as $result) {
			
			
			$result['description'] = trim($result['description']);  // edited for replcaing << with "
			$result['description'] = str_replace('«<p>', '«', $result['description']);
			$result['description'] = str_replace('</p>»', '»', $result['description']);


			if (!isset($setting['testimonial_character_limit']))
				$setting['testimonial_character_limit'] = 0;
				
				
			
			$result['description'] = mb_substr($result['description'], 0,250 , 'UTF-8'). ' ' .'... <b><a href="'.$data['more']. $result['testimonial_id'] .'" title="'.$data['text_more2'].'">'. $data['text_more'] . '</a></b>';

			if ($result['image']) {
			
						$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

			if (mb_strlen($result['title'],'UTF-8')>20)
					$result['title'] = mb_substr($result['title'], 0, 17, 'UTF-8').'...';

			if (mb_strlen($result['name'],'UTF-8')>10)
					$result['name'] = mb_substr($result['name'], 0, 7, 'UTF-8').'...';

			if (mb_strlen($result['city'],'UTF-8')>10)
					$result['city'] = mb_substr($result['city'], 0, 7, 'UTF-8').'...';

			$data['testimonials'][] = array(
				'id'			=> $result['testimonial_id'],		
				'thumb'       => $image,									  
				'title'		=> $result['title'],
				'description'	=> $result['description'],
				'rating'		=> $result['rating'],
				'name'		=> $result['name'],
				'date_added'	=> $result['date_added'],
				'city'		=> $result['city']

			);
		}

		

			$data['module'] = $module++;
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/module/nilkanthinfo_testimonial.tpl')) {
			return $this->load->view('module/nilkanthinfo_testimonial', $data);
		}

	
	}
}
?>