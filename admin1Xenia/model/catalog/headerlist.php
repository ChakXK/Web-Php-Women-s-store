<?php
class ModelCatalogHeaderlist extends Model {
	public function getLinkDescription($group_link_id) {
		$link_data = array();

		$link_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "headerlist WHERE group_link_id = '" . (int)$group_link_id . "'");


		foreach ($link_query->rows as $link) {
			$link_description_data = array();

			$link_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "headerlist_description WHERE link_id = '" . (int)$link['link_id'] . "'");

			foreach ($link_description_query->rows as $link_description) {
				$link_description_data[$link_description['language_id']] = array('name' => $link_description['name']);
			}

			$link_data[] = array(
				'link_id'          => $link['link_id'],
				'link_description' => $link_description_data,
				'sort_order'       => $link['sort_order'],
				'link'        	   => $link['link']
			);
		}



		return $link_data;
	}

	public function editLink($link_group_id, $data) {

		$this->db->query("DELETE FROM " . DB_PREFIX . "headerlist WHERE group_link_id = '" . (int)$link_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "headerlist_description WHERE group_link_id = '" . (int)$link_group_id . "'");

		if (isset($data['link'])) {
			foreach ($data['link'] as $link) {
				if ($link['link_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "headerlist SET link_id = '" . (int)$link['link_id'] . "', group_link_id = '" . (int)$link_group_id . "', sort_order = '" . (int)$link['sort_order'] ."', link = '" . $link['link'] . "'");
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "headerlist SET group_link_id = '" . (int)$link_group_id . "', sort_order = '" . (int)$link['sort_order'] . "', link = '" . $link['link'] . "'");
				}

				$link_id = $this->db->getLastId();

				foreach ($link['link_description'] as $language_id => $link_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "headerlist_description SET link_id = '" . (int)$link_id . "', language_id = '" . (int)$language_id . "', group_link_id = '" . (int)$link_group_id . "', name = '" . $this->db->escape($link_description['name']) . "'");
				}
			}
		}
	}

}
