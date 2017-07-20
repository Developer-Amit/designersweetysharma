<?php  
class ControllerModuleNilkanthinfoNewsletter extends Controller {
	public function index($setting) {
		
		
	
		$this->language->load('module/nilkanthinfo_newsletter');

		$data['heading_title'] = $this->language->get('heading_title');
		
		if(isset($setting['image'])){
			$data['image']=$setting['image'];
		}else {
			$data['image']='';
		}
		
		if(isset($setting['heading'])){
			$data['heading']=$setting['heading'];
		}else {
			$data['heading']='';
		}
		
		if(isset($setting['description'])){
			$data['description']=$setting['description'];
		}else {
			$data['description']='';
		}
		
 		
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/module/nilkanthinfo_newsletter.tpl')) {
				return $this->load->view('module/nilkanthinfo_newsletter', $data);
			}
		 
	}
	
	public function submitnilkanthinfo_newsletter() {
		$this->load->language('module/nilkanthinfo_newsletter');
		$this->load->model('nilkanthinfo/nilkanthinfo_newsletter');
 		
		if(isset($this->request->get['email']))
		{
			$msg = $this->model_nilkanthinfo_nilkanthinfo_newsletter->SubmitNewsletter(trim($this->request->get['email']));
		}
		echo $msg;
	}
}
?>
