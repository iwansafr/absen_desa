<?php

function is_member()
{
	$return = false;
	$role   = @$_SESSION[base_url().'_logged_in']['role'];
	if(!empty($role))
	{
		if(strtolower($role)=='member')
		{
			$return = true;
		}
	}
	return $return;
}