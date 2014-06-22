$(document).ready(function() {

	// $('select').selectpicker();

	var array_no_children=[];
	var array_folders=[];

	function add_ch(ch) {
	    if(ch.children){
	        if (ch.children.length > 0) {
	            array_folders.push(ch.id);
	            $.each(ch.children,function(){
	                add_ch(this);
	            });
	        } else {
	            array_no_children.push(ch.id);
	        }
	    }
	}

	function redraw_tree () {
		array_no_children=[];
	    array_folders=[];
    	console.log("redraw.jstree");
    	var json = $('#jstree').jstree().get_json();
		$.each(json,function(){
		    add_ch(this);
		});
   
    	console.log("Nodes that have no childrens: "+array_no_children);
    	console.log("Folder nodes: "+array_folders);

	    $.each(array_no_children,function(index, value){
	        $('#jstree').jstree(true).hide_icon(value);
	    });

	    $.each(array_folders,function(index, value){
	        $('#jstree').jstree(true).show_icon(value);
	    });    
	}


	$.get( "api/all_items", function(data) {
	  console.log(data);
	  $.each(data, function(id, name ){
	  	console.log(name.text);
    	$("#select-part1").append("<option>"+name.text+"</option>");
	   });
	});

	$('#jstree').jstree({
	    'core' : {
	    	'check_callback' : true,
	        'data' : {
	            'url' : 'api/all_items'
			}
	    },
	    'plugins' : [ "dnd", "sort", "contextmenu" ],
  	});

  	$('#button-expand').click(function() {
  		$('#jstree').jstree().open_all();
  	});

  	$('#button-collapse').click(function() {
  		$('#jstree').jstree().close_all();
  	});

	$('#jstree').on('create_node.jstree', function (create_node, data) {
		$.post( "api/add_item", { name: data.node.text, parent_id: data.parent } );
		$('#jstree').jstree().refresh();
	});


	$('#jstree').on('rename_node.jstree', function (rename_node, data) {
		$.post( "api/rename_item", { node_id: data.node.id, new_name: data.text } );
	}).jstree();


	$('#jstree').on('delete_node.jstree', function (delete_node, data) {
		$.post( "api/delete_item", { node_id: data.node.id } );
	}).jstree();


	$('#jstree').on('move_node.jstree', function (move_node, data) {
		console.log("Node moved");
		console.log(data.node);
		console.log("New parent id: "+data.parent);
		//$.post( "api/move_item", { node_id: data.node.id, new_parent: data.parent} );
		// API add method
	});

	function get_default_attr_form () {
		$.get( "ajax-static/attr_edit.html", function(html) {
			$("#property_edit").html(html);
		});
	}

	$('#jstree').on('select_node.jstree', function (event, node) {
		console.log("Node selected");
		console.log(node.node);
			if (node.node.children.length > 0) {
				console.log("folder selected");
				$("#property_edit").empty();
			} else {
				console.log("attr selected");
				get_default_attr_form();	
			}
		$("[name='attr-node-select']").bootstrapSwitch();
	});

	// add items

	$('#add_condition').on('click', function() {
		$.get( "ajax-static/rule_node.html", function(html) {
			$("#append-condition").append(html);
			$('select').selectpicker();
		});
	});

	$('#add_action').on('click', function() {
		$.get( "ajax-static/rule_node.html", function(html) {
			$("#append-action").append(html);
			$('select').selectpicker();
		});
	});

	$('#jstree').on('redraw.jstree', function () {
		console.log("redraw tree");
		redraw_tree();
	});

	$('#property_edit').on('click', '#add_value', function() {
		$.get( "ajax-static/value_node.html", function(html) {
			$("#values_edit").append(html);
		});
	});

	$('#property_edit').on('click', '.glyphicon-remove', function() {
		console.log("will remove");
		$(this).closest("tr").remove();
	});

	function get_binary_state () {
		if($("#is-attr-binary").is(':checked')) {
			$("#binary_choice").empty();
			$.get( "ajax-static/binary.html", function(html) {
				$("#binary_choice").html(html);
			});
			console.log('binary selector is checked');
		}
	}

	$('#property_edit').on('change', '#is-attr-binary', function() {
		console.log("binary switch changed");
		get_binary_state();
	});

});
