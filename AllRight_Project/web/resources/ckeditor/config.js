/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config
	
/*	config.toolbarGroups = [
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		'/',
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'ImageButton', grou}
	];*/

	config.language = 'ko';			//언어설정
	config.uiColor = '#EEEEEE';		//ui 색상
	config.height = '300px';		//Editor 높이  
	config.width = '650px';			//Editor 넓이
	config.contentsCss = ['/css/style.css'],['/css/main.css']; //홈페이지에서 사용하는 Css 파일 인클루드
	
	
	/*config.removeButtons = 'Source,Preview,Templates,PasteFromWord,Form,Checkbox,Radio,TextField,Textarea,Select,Button,HiddenField,Italic,CopyFormatting,BulletedList,Blockquote,CreateDiv,BidiLtr,BidiRtl,Link,Unlink,Anchor,Flash,SpecialChar,PageBreak,Iframe,About,Maximize,ShowBlocks,Font,Styles,Find,Replace,SelectAll,Scayt,Language';*/

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
/*	config.removeButtons = 'Underline,Subscript,Superscript';*/

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
};
