<?php
// . "' AND language_id = '" . (int)$this->config->get('config_language_id'). "'"
class ModelDesignHeaderlist extends Model {
	public function getLinks($group_link_id) {

		$link_data = array();

		$link_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "headerlist WHERE group_link_id = '" . (int)$group_link_id . "'");

		foreach ($link_query->rows as $link) {


			$link_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "headerlist_description WHERE link_id = '" . (int)$link['link_id'] . "' AND language_id = '" . (int)$this->config->get('config_language_id'). "'");

		
				$link_description_data = $link_description_query->rows[0]['name'];
			

			$link_data[] = array(
				'link_id'          => $link['link_id'],
				'link_description' => $link_description_data,
				'sort_order'       => $link['sort_order'],
				'link'        	   => $link['link']
			);
		}

		return $link_data;

	//	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "headerlist WHERE group_link_id = '" . (int)$group_link_id . "'");
	//	return $query->rows;
	}
}
