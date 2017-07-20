<?php 
class ControllerModuleNiCategoryTab extends Controller {
	public function index($setting) {
			
		$this->load->language('module/ni_category_tab');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['position']=$setting['position'];						//layout position of module by Nilkanthinfo
        
		$this->load->model('catalog/category');
		
       
                
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
                
		$data['categories'] = array();
		$data['products'] = array();
	
		foreach($setting['category'] as $category)
		{
			$cat=$this->model_catalog_category->getCategory($category);
			if($cat){
			
			array_push($data['categories'],$cat['name']);
			$data['products'][$cat['name']] = array();
			$filter_data = array(
				'filter_category_id'  => $cat['category_id'],
				'start' => 0,
				'limit' => $setting['limit']
			); 
			$results = $this->model_catalog_product->getProducts($filter_data);  
			foreach ($results as $result) 
     		{
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}
				
				//Added by nilkanthinfo
				if ($result['rollover_image']) {
					$rollover_image = $this->model_tool_image->resize($result['rollover_image'], $setting['width'], $setting['height']);
				} else {
					$rollover_image = '';
				}
				//end Added by nilkanthinfo

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
                                
				$data['products'][$cat['name']][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'rollover_thumb'   => $rollover_image,		//Added by nilkanthinfo
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'model'		 => $result['model'] // colorbox data
				);
				
				}
			}
		}
		
        
     	if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/module/ni_category_tab.tpl')) 
	 	{
				return $this->load->view('module/ni_category_tab', $data);
		} 
}


}