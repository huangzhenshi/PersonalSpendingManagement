/**
 * Copyright (c) 2014, CKSource - Frederico Knabben. All rights reserved.
 * Licensed under the terms of the MIT License (see LICENSE.md).
 *
 * Basic sample plugin inserting current date and time into the CKEditor editing area.
 *
 * Created out of the CKEditor Plugin SDK:
 * http://docs.ckeditor.com/#!/guide/plugin_sdk_intro
 */

// Register the plugin within the editor.
CKEDITOR.plugins.add('page', {
	    init: function(editor) {
			editor.addCommand('page', {
				exec : function(editor) {
					var nextPage = CKEDITOR.dom.element.createFromHtml('<p>[NextPage][/NextPage]</p>', editor.document);
					var ranges = editor.getSelection().getRanges( true );
					for (var range,i=ranges.length-1; i >= 0; i--) {
						range = ranges[i];
						if (i < ranges.length -1 ) {
							nextPage = nextPage.clone(true);				
						}
						range.splitBlock( 'p' );
						range.insertNode( nextPage );
						if (i==ranges.length-1 ) {
							var next = nextPage.getNext();
							range.moveToPosition(nextPage, CKEDITOR.POSITION_AFTER_END);
							if (!next || next.type==CKEDITOR.NODE_ELEMENT && !next.isEditable()) {
								range.fixBlock(true, editor.config.enterMode==CKEDITOR.ENTER_DIV ? 'div' : 'p');					
							}
							range.select();
						}
					}
				}
			});
			editor.ui.addButton('Page', {
				label: '插入文章分页符',
				command: 'page',
				icon : this.path + 'images/page.png'
			});
	    }
	});
