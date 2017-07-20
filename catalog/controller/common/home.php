<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		
		/*Added by Nilkanthinfo*/
		
		$this->load->model('extension/extension');
   		$installed_modules = $this->model_extension_extension->getExtensions('module');
		
		$this->load->model('extension/module');
		
		 $newsletter_module='nilkanthinfo_newsletter';
	
		 $check_status=$this->model_extension_module-> getModulesByCode('nilkanthinfo_newsletter');
		  
		  
		for($i=0;$i<sizeof($installed_modules);$i++)
		{ 
				$mod[$i]=$installed_modules[$i]['code'];
		}
		
				
		$language_id=(int)$this->config->get('config_language_id');
		
		
		
		 if((in_array( $newsletter_module, $mod)) && !empty($check_status)&& isset($check_status['module_description'][$language_id]['is_popup']) && $check_status['module_description'][$language_id]['is_popup']=='on' && $check_status['status']=='1'   ) {
					$data['popup_newsletter'] = 'on';
					$data['popup_link'] = $this->url->link('module/nilkanthinfo_newsletter');
					$data['heading'] = $check_status['module_description'][$language_id]['heading'];
					$data['description'] = $check_status['module_description'][$language_id]['description'];
					$data['image'] = $check_status['module_description'][$language_id]['image'];
					$data['position'] = $check_status['module_description'][$language_id]['position'];
					$data['repeat'] = $check_status['module_description'][$language_id]['repeat'];
		 }
		 else
		 {
		 		$data['popup_newsletter'] = 'off';
				$data['popup_link'] = '';
				$data['heading'] = '';
					$data['description'] = '';
					$data['image'] = '';
					$data['position'] = '';
					$data['repeat'] = '';
		 }
		
	    //----------------------------------------

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}