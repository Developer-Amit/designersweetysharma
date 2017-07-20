<?php
// By Amit Mishra
class ControllerFeedWebApi extends Controller {
	# Use print_r($json) instead json_encode($json)
	private $debug = false;

	// Get base URL 
    public function baseurl() {
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			echo $data['base'] = $this->config->get('config_url');
		} else {
			echo $data['base'] = $this->config->get('config_url');
		}
	}

	/// Add New Store
	public function addmystore() {
  	        $this->init();
			$this->load->model('setting/store');
			$json = array('success' => true);
			$data = array();
			$datajson = file_get_contents('php://input');
			$data = json_decode($datajson, true);

		 if (isset($data)) {
 
            $store = $this->model_setting_store->getStores();
            foreach ($store as $s) {
            	# code...
            	if($s['url'] === $data['config_url'] && $s['name'] === $data['config_name'])
            	{
            		$json= array('success' => false, 'message' => 'Store name and url exist! give different name');
            		return $this->response->setOutput(json_encode($json));
            	}
            }
				$storetemplate  = $data['config_template'];
				$storemetakey   = $data['config_meta_keyword'];
				$storemetadesc  = $data['config_meta_description'];
				$storemetatitle = $data['config_meta_title'];
				$storeimage     = $data['config_image'];
				$storeconfigfax = $data['config_fax'];
				$storetelephone = $data['config_telephone'];
				$storeemail     = $data['config_email'];
				$storeaddress   = $data['config_address'];
				$storegeocode   = $data['config_geocode'];
				$storeowner     = $data['config_owner'];
				$storename      = $data['config_name'];
				$storessl       = $data['config_ssl'];

				$storeurl       = $data['config_url'];
				$storelogo      = $data['config_logo'];
				$storelangauge  = $data['config_language'];
				$storecurrency  = $data['config_currency'];
				$storeproductlimit= $data['config_product_limit'];
				$chechstorename = substr(strrchr(rtrim($storeurl, '/'), '/'), 1);

			if($storename !== $chechstorename){
			    $storename = $chechstorename;
			    $data['config_name'] = $storename;
			}

			if ($storename !== '' && $storemetatitle !== '' && $storeurl !== '' && $storeowner !== '' && $storeaddress !== '' && $storeemail !== '' && $storetelephone !== '') 
			{

				$store_id = $this->model_setting_store->addStore($data);

				$this->load->model('setting/setting');

			    $this->model_setting_setting->editSetting('config', $data, $store_id);
			    if($store_id){
			    	$userdata = [
			    	'user_group_id' => 11,
			    	'username'      => $storename,
			    	'password'      => $storename.mt_rand(100,999),
			    	'firstname'     => $storename,
			    	'lastname'      => $storename,
			    	'email'         => $storeemail,
			    	'status'        => 1,
			    	'storeid'       => $store_id,
			    	'image'         => '',
                    ];

			    	$owner = $this->model_setting_store->registerStoreOwner($userdata);
                    $owner[0]['password'] = $userdata['password'];
			    	$json['storeowner'] = $owner;
				    if (!is_dir("./$storename")) {
					// Create new directory for store
				    mkdir("./$storename", 0755, true);
				    chmod("./$storename", 0755);  // octal; correct value of mode
				    // Create new index.php file in store
				    $indexfile = fopen("./$storename/index.php","w");
				    fwrite($indexfile, '<?php include("../index.php");?>');
				    fclose($indexfile);

				    // Create new .htaccess file in store
				    $htaccessfile = fopen("./$storename/.htaccess","w");
				    fwrite($htaccessfile, '# SEO URL Settings'.PHP_EOL);
				    fclose($htaccessfile);
				    file_put_contents("./$storename/.htaccess", 'RewriteBase /'.$storename.'/'.PHP_EOL, FILE_APPEND);
				    file_put_contents("./$storename/.htaccess", 'RewriteEngine On'.PHP_EOL, FILE_APPEND);
				    file_put_contents("./$storename/.htaccess", 'RewriteRule ^image/([^?]*) /image/$1 [L,QSA]'.PHP_EOL,FILE_APPEND);
				    file_put_contents("./$storename/.htaccess", 'RewriteRule ^catalog/([^?]*) /catalog/$1 [L,QSA]'.PHP_EOL, FILE_APPEND);
				    file_put_contents("./$storename/.htaccess", 'RewriteRule ^download/([^?]*) /download/$1 [L,QSA]'.PHP_EOL, FILE_APPEND);
				 }

				 $json['storeid']= $store_id;

					if ($this->debug) {
						echo '<pre>';
						print_r($json);
						} else if($json) {
							$this->response->setOutput(json_encode($json));
						}
			    } 

			}else{
					$json = array('success' => false, 'message' => 'Please fill all required data on sending json');
		    	    $this->response->setOutput(json_encode($json));
			}
			
		}else{
			$json = array('success' => false, 'message' => 'Please send valid data request');
		    	    $this->response->setOutput(json_encode($json));
		}

	}


    // Add product on a store.
    	public function addproduct() {
    	$this->init();
		$this->load->model('setting/store');
        $json = array('success' => true);
		$data = array();
		$datajson = file_get_contents('php://input');
		$data = json_decode($datajson, true);
	    if(isset($data)){
		$product_id = $this->model_setting_store->addProduct($data);
        $json['product_id'] = $product_id;
        if ($this->debug) {
			echo '<pre>';
			print_r($json);
		} else {
			$this->response->setOutput(json_encode($json));
		}
		}else{
		   $json = array('success' => false, 'message' => 'Somthing went wrong!');
           $this->response->setOutput(json_encode($json));
		}

			
	}



	// For Categories ////////////////
	public function categories() {
		$this->init();
		$this->load->model('catalog/category');
		$json = array('success' => true);
		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['parent'])) {
			$parent = $this->request->get['parent'];
		} else {
			$parent = 0;
		}
		if (isset($this->request->get['level'])) {
			$level = $this->request->get['level'];
		} else {
			$level = 1;
		}
		# -- End $_GET params --------------------------
		$json['categories'] = $this->getCategoriesTree($parent, $level);
		if ($this->debug) {
			echo '<pre>';
			print_r($json);
		} else {
			$this->response->setOutput(json_encode($json));
		}
	}

	/// Get Category///

	public function category() {
		$this->init();
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$json = array('success' => true);
		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['id'])) {
			$category_id = $this->request->get['id'];
		} else {
			$category_id = 0;
		}
		# -- End $_GET params --------------------------
		$category = $this->model_catalog_category->getCategory($category_id);
		
		$json['category'] = array(
			'id'                    => $category['category_id'],
			'name'                  => $category['name'],
			'description'           => $category['description'],
			'href'                  => $this->url->link('product/category', 'category_id=' . $category['category_id'])
		);
		if ($this->debug) {
			echo '<pre>';
			print_r($json);
		} else {
			$this->response->setOutput(json_encode($json));
        }
    }


    //////Add new Customer

    public function addcustomer() {
		$this->init();
		$this->load->model('account/customer');
		$this->load->model('account/address');
		$json = array('success' => true);
		$data = array();
        if(isset($_REQUEST['userdata'])){
			$datajson =$_REQUEST['userdata'];

			$data = json_decode($datajson, true);
            $useremail= $data['email'];
            $customercheck = $this->model_account_customer->getCustomerByEmail($useremail);
            if ($customercheck!='') {
            	$json = array('success' => false, 'message' =>'User already exist!');
			    $this->response->setOutput(json_encode($json));
            }else{

			    $addcustomer = $this->model_account_customer->addCustomer($data);
			    $json['customer_id']= $addcustomer;

				if ($this->debug) {
					echo '<pre>';
					print_r($json);
				} else {
					$this->response->setOutput(json_encode($json));
				}
            }
			
	    }else{
			$json = array('success' => false, 'message' =>'Somthing went wrong! Send valid jon parameter');
			$this->response->setOutput(json_encode($json));
	    }
	}

	public function getcustomer() {
		$this->init();
		$this->load->model('account/customer');
		$this->load->model('account/address');
		$json = array('success' => true);
		if (isset($this->request->get['email'])) {
			$customer_email = $this->request->get['email'];
			$customer = $this->model_account_customer->getCustomerByEmail($customer_email);
		}elseif(isset($this->request->get['contact'])) {
			$customer_contact = $this->request->get['contact'];
			$customer = $this->model_account_customer->getCustomerByContact($customer_contact);
		}

        if ($customer) {
			$json['customerinfo'][]= $customer;

	        /// Now getting customer address from customer_id	
			$customerID = $customer['customer_id'];
			$customeraddress = $this->model_account_address->getAddressByCustomer($customerID);
			$json['customeraddress'][]= $customeraddress;

			if ($this->debug) {
				echo '<pre>';
				print_r($json);
			} else {
				$this->response->setOutput(json_encode($json));
			}
	    }else{
			$json = array('success' => false);
			$this->response->setOutput(json_encode($json));
	    }
	}
	//// End Users//////////

	public function getshippingmethod() {
			$this->init();
			$this->load->model('extension/extension');
			$this->load->model('checkout/order');
			$json = array('success' => true);

	        $shipping_exts = $this->model_extension_extension->getExtensions('shipping');
	        $store_id =0;
	        $shipping_type= $shipping_exts[0]['type']; 
	        $shipping_code= $shipping_exts[0]['code'];
	        $code_cost = $shipping_code.'_cost';
	        $results_cost = $this->model_checkout_order->getStroreShippingCost($store_id, $shipping_code, $code_cost);
	        $getresultarr = $results_cost->rows;
			$json['shipping_data']= array(
				'type'                    => $shipping_type,
				'store_id'                  => $getresultarr[0]['store_id'],
				'method'           => $getresultarr[0]['code'],
				'rate'                 => $getresultarr[0]['value']
			);
			if ($this->debug) {
				echo '<pre>';
				print_r($json);
			} else {
				$this->response->setOutput(json_encode($json));
			}
    }

/// Add new Order  ////
	public function addorder() {
			$this->init();
			$this->load->model('checkout/order');
			$json = array('success' => true);
			$data = array();
			$datajson = file_get_contents('php://input');
			$data = json_decode($datajson, true);
	        if(isset($data)){
				// Check required filed is filled
				$ord_total =$data['totals'];
				$ordstore_url =$data['store_url'];
				$ordcustomer_id =$data['customer_id'];
				$ord_email =$data['email'];
				$ord_payment_method =$data['payment_method'];
				$ordshipping_postcode =$data['shipping_postcode'];
				$ord_products =$data['products'];

				$order_status_id = $data['order_status_id'];
				# -- End $_GET params --------------------------
				if ($ord_total !== '' && $ordstore_url !== '' && $ordcustomer_id !== '' && $ord_email !== '' && $ord_payment_method !== '' && $ordshipping_postcode !== '' && $ord_products !== '' && $order_status_id !== '') {
						$cretaeOrder = $this->model_checkout_order->addOrder($data);
						$order_id =$cretaeOrder;
						$orderhisstry = $this->model_checkout_order->addOrderHistory($order_id,$order_status_id );
				        $json['orderid']= $order_id;
						if ($this->debug) {
							echo '<pre>';
							print_r($json);
						} else if($json) {
							$this->response->setOutput(json_encode($json));
						}
				}else{
					$json = array('success' => false, 'message' => 'Please fill all required data on sending json');
		    	    $this->response->setOutput(json_encode($json));
				}
		    }else{
		    	$json = array('success' => false, 'message' => 'Invalid Data format');
		    	$this->response->setOutput(json_encode($json));
		    }
		}

	/// Get Order by Order ID ////


	// public function addneworderold() {
	// 		$this->init();
	// 		$this->load->model('checkout/order');
	// 		$json = array('success' => true);
	// 		$data = array();
	//         if(isset($_REQUEST['datajson'])){
	// 			$datajson =$_REQUEST['datajson'];
	// 			$data = json_decode($datajson, true);
	// 			// Check required filed is filled
	// 			$ord_total =$data['totals'];
	// 			$ordstore_url =$data['store_url'];
	// 			$ordcustomer_id =$data['customer_id'];
	// 			$ord_email =$data['email'];
	// 			$ord_payment_method =$data['payment_method'];
	// 			$ordshipping_postcode =$data['shipping_postcode'];
	// 			$ord_products =$data['products'];

	// 			$order_status_id = $data['order_status_id'];
	// 			# -- End $_GET params --------------------------
	// 			if ($ord_total !== '' && $ordstore_url !== '' && $ordcustomer_id !== '' && $ord_email !== '' && $ord_payment_method !== '' && $ordshipping_postcode !== '' && $ord_products !== '' && $order_status_id !== '') {
	// 					$cretaeOrder = $this->model_checkout_order->addOrder($data);
	// 					$order_id =$cretaeOrder;
	// 					$orderhisstry = $this->model_checkout_order->addOrderHistory($order_id,$order_status_id );
	// 			        $json['orderid']= $order_id;
	// 					if ($this->debug) {
	// 						echo '<pre>';
	// 						print_r($json);
	// 					} else if($json) {
	// 						$this->response->setOutput(json_encode($json));
	// 					}
	// 			}else{
	// 				$json = array('success' => false, 'message' => 'Please fill all required data on sending json');
	// 	    	    $this->response->setOutput(json_encode($json));
	// 			}
	// 	    }else{
	// 	    	$json = array('success' => false, 'message' => 'Invalid Data format');
	// 	    	$this->response->setOutput(json_encode($json));
	// 	    }
	// 	}

	/// Get Order by Order ID ////


	public function getorderdetails() {
			$this->init();
			$this->load->model('checkout/order');
			$json = array('success' => true);
			# -- $_GET params ------------------------------
			
			if (isset($this->request->get['orderid'])) {
					$order_id = $this->request->get['orderid'];
				# -- End $_GET params --------------------------
				$order = $this->model_checkout_order->getOrder($order_id);
		        $json['order'][]= $order;
				if ($this->debug) {
					echo '<pre>';
					print_r($json);
				} else {
					$this->response->setOutput(json_encode($json));
				}
		    }else{
		    	$json = array('success' => false, 'message' => 'Invalid OrderID');
		    	$this->response->setOutput(json_encode($json));
		    }
		}


	// Get All Orders By Customer Email
    public function getallorders() {
			$this->init();
			$this->load->model('checkout/order');
			$json = array('success' => true);
			# -- $_GET params ------------------------------
			
			if (isset($this->request->get['customer_email'])) {
				$email = $this->request->get['customer_email'];
				# -- End $_GET params --------------------------
				$orders = $this->model_checkout_order->getOrdersByEmail($email);
		        $json['orders'][]= $orders->rows;
				if ($this->debug) {
					echo '<pre>';
					print_r($json);
				} else {
					$this->response->setOutput(json_encode($json));
				}
		    }elseif (isset($this->request->get['customer_contact'])) {
				$contact = $this->request->get['customer_contact'];
				# -- End $_GET params --------------------------
				$orders = $this->model_checkout_order->getOrdersByContact($contact);
                $orders = $orders->rows;
		        $json['orders'][]= $orders;
				if ($this->debug) {
					echo '<pre>';
					print_r($json);
				} else {
					$this->response->setOutput(json_encode($json));
				}
		    }
		    else{
		    	$json = array('success' => false, 'message' => 'Invalid OrderID');
		    	$this->response->setOutput(json_encode($json));
		    }
		}

  //   public function editorder() {
		// 	$this->init();
		// 	$this->load->model('checkout/order');
		// 	$json = array('success' => true);
		// 	$data = array();
	 //        if((isset($_REQUEST['datajson'] && $_REQUEST['orderid'])){
		// 		$datajson = $_REQUEST['datajson'];
		// 		$order_id = $_REQUEST]['orderid'];
				
		// 		$data = json_decode($datajson, true);
		// 		$order_status_id = $data['order_status_id'];
		// 		# -- End $_GET params --------------------------
		// 		$cretaeOrder = $this->model_checkout_order->editorder($data);
		// 		$order_id =$cretaeOrder;
		// 		$orderhisstry = $this->model_checkout_order->addOrderHistory($order_id, $order_status_id);
		//         $json['orderid']= $order_id;
		// 		if ($this->debug) {
		// 			echo '<pre>';
		// 			print_r($json);
		// 		} else if($json) {
		// 			$this->response->setOutput(json_encode($json));
		// 		}
		// 	}else{
		// 		$json = array('success' => true, 'message' => 'Invalid sebding parameter');
		// 		$this->response->setOutput(json_encode($json));
		// 	}
		// }
	// For cancel order based on order ID.

	public function cancelorder() {
		    $this->init();
			$this->load->model('checkout/order');
			$json = array('success' => true);
			// Void the order first
			if(isset($_REQUEST['orderid'])){
				$order_id = $_REQUEST['orderid'];
				$cancelorder = $this->model_checkout_order->addOrderHistory($order_id, 7);
				$this->response->setOutput(json_encode($json));
			}else{
				$json = array('success' => false, 'message'=>'Invalid parameter used!');
				$this->response->setOutput(json_encode($json));
			}

	}

	// For users ///////////////
		// public function getcustomers() {
		// 	$this->init();
		// 	$this->load->model('account/customer');
		// 	$json = array('success' => true);
			
		// 	$allcustomer = $this->model_account_customer->getallCustomer();
		// 	print_r($allcustomer); die();
		// 	if ($this->debug) {
		// 		echo '<pre>';
		// 		print_r($json);
		// 	} else {
		// 		$this->response->setOutput(json_encode($json));
		// 	}
		// }


  // For Products ///////////////
	// public function products() {
	// 	$this->init();
	// 	$this->load->model('catalog/product');
	// 	$this->load->model('tool/image');
	// 	$json = array('success' => true, 'products' => array());
	// 	# -- $_GET params ------------------------------
		
	// 	if (isset($this->request->get['category'])) {
	// 		$category_id = $this->request->get['category'];
	// 	} else {
	// 		$category_id = 0;
	// 	}
	// 	# -- End $_GET params --------------------------
	// 	$products = $this->model_catalog_product->getProducts(array(
	// 		'filter_category_id'	=> $category_id
	// 	));
	// 	foreach ($products as $product) {
	// 		if ($product['image']) {
	// 			$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
	// 		} else {
	// 			$image = false;
	// 		}
	// 		if ((float)$product['special']) {
	// 			$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
	// 		} else {
	// 			$special = false;
	// 		}
	// 		$json['products'][] = array(
	// 			'id'                    => $product['product_id'],
	// 			'name'                  => $product['name'],
	// 			'description'           => $product['description'],
	// 			'pirce'                 => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
	// 			'href'                  => $this->url->link('product/product', 'product_id=' . $product['product_id']),
	// 			'thumb'                 => $image,
	// 			'special'               => $special,
	// 			'rating'                => $product['rating']
	// 		);
	// 	}
	// 	if ($this->debug) {
	// 		echo '<pre>';
	// 		print_r($json);
	// 	} else {
	// 		$this->response->setOutput(json_encode($json));
	// 	}
	// }

	// Get Single product with product_id ///
	public function getproduct() {
		$this->init();
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('checkout/order');

		$json = array('success' => true);
		# -- $_GET params ------------------------------
		
		if (isset($this->request->get['id'])) {
			$product_id = $this->request->get['id'];
			# -- End $_GET params --------------------------
			$product = $this->model_catalog_product->getProduct($product_id);
			$store_details = $this->model_checkout_order->getStroredetails($product_id);
			$store_detail = $store_details->rows;
			$json['product'][] =$product;
			$json['store_details'][] = $store_detail;
			
			if ($this->debug) {
				echo '<pre>';
				print_r($json);
			} else {
				$this->response->setOutput(json_encode($json));
			}
	    }else{
	    	 $json = array('success' => false);
	    	 $this->response->setOutput(json_encode($json));
	    }
	}

	/**
	 * Generation of category tree
	 * 
	 * @param  int    $parent  Prarent category id
	 * @param  int    $level   Depth level
	 * @return array           Tree
	 */
	private function getCategoriesTree($parent = 0, $level = 1) {
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		
		$result = array();
		$categories = $this->model_catalog_category->getCategories($parent);
		if ($categories && $level > 0) {
			$level--;
			foreach ($categories as $category) {
				if ($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
				} else {
					$image = false;
				}
				$result[] = array(
					'category_id'   => $category['category_id'],
					'parent_id'     => $category['parent_id'],
					'name'          => $category['name'],
					'image'         => $image,
					'href'          => $this->url->link('product/category', 'category_id=' . $category['category_id']),
					'categories'    => $this->getCategoriesTree($category['category_id'], $level)
				);
			}
			return $result;
		}
	}
	/**
	 * 
	 */
	private function init() {
		// $this->response->addHeader('Content-Type: application/json');
		// if (!$this->config->get('web_api_status')) {
		// 	$this->error(10, 'API is disabled');
		// }
		// if ($this->config->get('web_api_key') && (!isset($this->request->get['key']) || $this->request->get['key'] != $this->config->get('web_api_key'))) {
		// 	$this->error(20, 'Invalid secret key');
		// }
		return true;
	}
	/**
	 * Error message responser
	 *
	 * @param string $message  Error message
	 */
	private function error($code = 0, $message = '') {
		# setOutput() is not called, set headers manually
		header('Content-Type: application/json');
		$json = array(
			'success'       => false,
			'code'          => $code,
			'message'       => $message
		);
		if ($this->debug) {
			echo '<pre>';
			print_r($json);
		} else {
			echo json_encode($json);
		}
		
		exit();
	}
}