 <?php
      m_set_host('localhost', 7042, '', '');
      $key = m_order("^PATIENTS", "");
      while ($key != "") {
        $name = m_get("^PATIENTS", $key, "name");
        $id = $key;
        $address = m_get("^PATIENTS", $key, "address");
        $age = m_get("^PATIENTS", $key, "age");
        $sex = m_get("^PATIENTS", $key, "sex");
        $key = m_order("^PATIENTS", $key);
      }
      print('{"id": "' . $id . '","name": "' . $name . '","address": "' . $address . '","age": "' . $age . '","sex": "' . $sex . '"}');
?>
