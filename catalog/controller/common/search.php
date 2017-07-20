<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');
		
		//Added by Nilkanthinfo for category search
		$data['text_category'] = $this->language->get('text_category');
		
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
					
				
					
					// Level 3
					
						$child3_data = array();

						$children_3 = $this->model_catalog_category->getCategories($child['category_id']);
		
						foreach ($children_3 as $child3) {
							$data3 = array(
								'filter_category_id'  => $child3['category_id'],
								'filter_sub_category' => true
							);
						
		
							$product_total1 = $this->model_catalog_product->getTotalProducts($data3);
		
							$child3_data[] = array(
								
								'name'  => $child3['name'] ,
								'category_id'  => $child3['category_id']
								
								);	
						}
					// End Level 3
							
					$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

					$children_data[] = array(
						'name'  => $child['name'] ,
						'category_id'  => $child['category_id'],
						'total_product' => $product_total,
						'children3' => $child3_data
					);
				}
				
				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'category_id'     => $category['category_id']
				);
			}
		}
		
		if(isset($this->request->get['category_id'])){
			$data['category_id'] = $this->request->get['category_id'];
		}else{
			$data['category_id'] = 0;
		}
		//End Added by Nilkanthinfo for category search

		$data['text_search'] = $this->language->get('text_search');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		return $this->load->view('common/search', $data);
	}
}