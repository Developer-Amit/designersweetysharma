<?php 
class ControllerModuleNilkanthinfoProductTab extends Controller {
	public function index($setting) {
	

		$this->load->language('module/nilkanthinfoproduct_tab');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['position']=$setting['position'];						//layout position of module by Nilkanthinfo
                
      //  $data['tab_latest'] = $this->language->get('tab_latest');
        $data['tab_popular'] = $this->language->get('tab_popular');
        $data['tab_bestseller'] = $this->language->get('tab_bestseller');
        $data['tab_special'] = $this->language->get('tab_special');
		
                
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
                
	//--------      popular Products Tab Starts ------------------- 
			
        $data['popular_products'] = array();
		
                     
		
        $popular_results = $this->model_catalog_product->getPopularProducts($setting['limit']);
	
		foreach ($popular_results as $result) 
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
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'],$this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
                                
				$data['popular_products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'rollover_thumb'   => $rollover_image,		//Added by nilkanthinfo
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 30) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'model'		 => $result['model'] // colorbox data
				);
		}
		
	//-------- popular Products Tab Ends ------------------- 
	
	//-------- Bestseller Products Tab starts ------------------- 
		
		$data['bestseller_products'] = array();
		
		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);

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
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')),$this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'],$this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['bestseller_products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'rollover_thumb'   => $rollover_image,		//Added by nilkanthinfo
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 30) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'model'		 => $result['model'] // colorbox data
				);
		}

			
		
	//-------- Bestseller Products Tab Ends ------------------- 
		
	//-------- Special Products Tab starts ------------------- 		
		
		
		$data['special_products'] = array();
		
		$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);
		
		$special_results = $this->model_catalog_product->getProductSpecials($filter_data);

		foreach ($special_results as $result) 
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

				$data['special_products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'rollover_thumb'   => $rollover_image,		//Added by nilkanthinfo
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 30) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'model'		 => $result['model'] // colorbox data
				);
			}
		
	//-------- Special Products Tab Ends ------------------- 	


	//-------- popular Products Tab starts ------------------- 		
	//-------- popular Products Tab Ends ------------------- 		
        
     	if (file_exists(DIR_TEMPLATE . $this->config->get('theme_default_directory') . '/template/module/nilkanthinfoproduct_tab.tpl')) 
	 	{
				return $this->load->view('module/nilkanthinfoproduct_tab', $data);
		} 
}


}