set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>5463118353576079
,p_default_application_id=>109672
,p_default_owner=>'HR'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/kalc_apex_open_inline_dialog
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(17782523547923199)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'KALC.APEX.OPEN.INLINE.DIALOG'
,p_display_name=>'KALC Open Inline Dialog'
,p_category=>'NAVIGATION'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#kalcOpenInlineDialog-min.js'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'FUNCTION kalc_render_open_inline_dialog',
'  ( p_dynamic_action IN apex_plugin.t_dynamic_action,',
'    p_plugin         IN apex_plugin.t_plugin )',
'  RETURN apex_plugin.t_dynamic_action_render_result',
'IS',
'  l_result                 apex_plugin.t_dynamic_action_render_result;',
'  l_idlg_id                p_dynamic_action.attribute_01%TYPE := p_dynamic_action.attribute_01;',
'  l_idlg_title_item        p_dynamic_action.attribute_02%TYPE := p_dynamic_action.attribute_02;',
'  l_dynamic_size           p_dynamic_action.attribute_03%TYPE := p_dynamic_action.attribute_03;',
'  l_idlg_width             p_dynamic_action.attribute_04%TYPE := p_dynamic_action.attribute_04;',
'  l_idlg_height            p_dynamic_action.attribute_05%TYPE := p_dynamic_action.attribute_05;',
'  l_idlg_width_item        p_dynamic_action.attribute_06%TYPE := p_dynamic_action.attribute_06;',
'  l_idlg_height_item       p_dynamic_action.attribute_07%TYPE := p_dynamic_action.attribute_07;',
'  l_modal                  p_dynamic_action.attribute_08%TYPE := p_dynamic_action.attribute_08;',
'  l_position_dialog        p_dynamic_action.attribute_09%TYPE := p_dynamic_action.attribute_09;',
'  l_position_my            p_dynamic_action.attribute_10%TYPE := p_dynamic_action.attribute_10;',
'  l_position_my_offset     p_dynamic_action.attribute_11%TYPE := p_dynamic_action.attribute_11;',
'  l_position_at            p_dynamic_action.attribute_12%TYPE := p_dynamic_action.attribute_12;',
'  l_position_at_offset     p_dynamic_action.attribute_13%TYPE := p_dynamic_action.attribute_13;',
'  l_position_of            p_dynamic_action.attribute_14%TYPE := p_dynamic_action.attribute_14;',
'BEGIN',
'  -- Debug this DA if running in debug mode',
'  IF apex_application.g_debug THEN',
'    apex_plugin_util.debug_dynamic_action( p_plugin              => p_plugin,',
'                                           p_dynamic_action      => p_dynamic_action );',
'  END IF;',
'  --',
'  l_result.javascript_function := ''kalcOpenInlineDialog'';',
'  --',
'  l_result.attribute_01 := l_idlg_id;',
'  l_result.attribute_02 := UPPER(l_idlg_title_item);',
'  l_result.attribute_03 := l_dynamic_size;',
'  l_result.attribute_04 := l_idlg_width;',
'  l_result.attribute_05 := l_idlg_height;',
'  l_result.attribute_06 := UPPER(l_idlg_width_item);',
'  l_result.attribute_07 := UPPER(l_idlg_height_item);',
'  l_result.attribute_08 := l_modal;',
'  l_result.attribute_09 := l_position_dialog;',
'  l_result.attribute_10 := l_position_my;',
'  l_result.attribute_11 := l_position_my_offset;',
'  l_result.attribute_12 := l_position_at;',
'  l_result.attribute_13 := l_position_at_offset;',
'  l_result.attribute_14 := l_position_of;',
'  --',
'  RETURN l_result;',
'END kalc_render_open_inline_dialog;'))
,p_render_function=>'kalc_render_open_inline_dialog'
,p_standard_attributes=>'ITEM'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'A lightweight Dynamic Action Plug-In that allows you to customise the size, position and title of Inline Dialogs before opening'
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/kalconsultancyltd/kalc-open-inline-dialog'
,p_files_version=>30
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17788382011262345)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Inline Dialog Static ID'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Enter the Static ID of the inline dialog that you wish to open (make sure you entered a Static ID for the inline dialog region and that you get the case correct)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17789644648143674)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Dynamic Inline Dialog Title Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Select a Page Item that will hold the textual content to be used as the Inline Dialog Title<br />',
'If left empty, the default Inline Dialog Region title will be used (or any previously used title if the Inline Dialog region is initiated/shown from multiple sources)<br />',
'<br />',
'Ensure that you set the value of the page item into current browser page session <b>before</b> this dynamic action is fired'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17998194750063546)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Dynamic Size'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Select if you want to set static values for the inline dialog size (No) or if you want the dialog dimensions to be set from values held in page items (Yes)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17791241729167204)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Inline Dialog Width (px)'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_default_value=>'600'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17998194750063546)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>'Enter an Integer defining the initial width of the inline dialog on opening (pixels)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17791713898168910)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Inline Dialog Height (px)'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_default_value=>'480'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17998194750063546)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>'Enter an Integer defining the initial height of the inline dialog on opening (pixels)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17999302238082787)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Inline Dialog Width Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17998194750063546)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'Select a page item that holds an integer defining the width of the inline dialog (pixels)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17999587171085096)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Inline Dialog Height Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17998194750063546)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_help_text=>'Select a page item that holds an integer defining the height of the inline dialog (pixels)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17905527191164485)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Modal Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'true'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Modal: The inline dialog must be dismissed before you can intereact with the rest of the page<br />',
'Non-Modal: Multiple inline dialogs can be displayed and the page may still be interacted with'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17905758402165126)
,p_plugin_attribute_id=>wwv_flow_api.id(17905527191164485)
,p_display_sequence=>10
,p_display_value=>'Modal'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17906212617165840)
,p_plugin_attribute_id=>wwv_flow_api.id(17905527191164485)
,p_display_sequence=>20
,p_display_value=>'Non-Modal'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17782772613967876)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Position the Dialog'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Select Yes if you wish to position the Inline Dialog to something <b>other</b> than the centre of the page on opening<br />',
'This allows you to open inline dialogs closer to relevant regions or items in a page'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17783074356067524)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Position My'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'center center'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17782772613967876)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Defines which position of the Inline Dialog to align with the target element:<br />',
'"horizontal vertical"'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17784250341075509)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>10
,p_display_value=>'center top'
,p_return_value=>'center top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17783762533074437)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>20
,p_display_value=>'center center'
,p_return_value=>'center center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17784613803076959)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>30
,p_display_value=>'center bottom'
,p_return_value=>'center bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17785573504091632)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>40
,p_display_value=>'left top'
,p_return_value=>'left top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17785954458092712)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>50
,p_display_value=>'left center'
,p_return_value=>'left center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17786422165093565)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>60
,p_display_value=>'left bottom'
,p_return_value=>'left bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17786807968094870)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>70
,p_display_value=>'right top'
,p_return_value=>'right top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17787251745095773)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>80
,p_display_value=>'right center'
,p_return_value=>'right center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17787633983096673)
,p_plugin_attribute_id=>wwv_flow_api.id(17783074356067524)
,p_display_sequence=>90
,p_display_value=>'right bottom'
,p_return_value=>'right bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17817437714563655)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Position My Offset'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17782772613967876)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Given a "Position My" = center center<br />',
'<br />',
'<b>10</b> - would return "center+10 center+10"<br />',
'<b>5% -20</b> - would return "center+5% center-20"'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Each dimension of the position can be given an offset - either in pixels or percentages<br />',
'Percentage offsets are relative to the Inline Dialog being positioned<br />',
'If only one value is supplied, it will be used for both horizontal and vertical offsets<br />',
'Separate horizontal and vertical offsets with a space character (horizontal vertical)<br />',
'Prefix negative pixel/percentage amounts with a minus sign (do NOT prefix positive numbers)<br />',
'Positive horizontal values move the inline dialog to the right<br />',
'Positive vertical values move the inline dialog down<br />',
'<br />',
'Note: The only space character that is acceptable is _between_ the horizontal and vertical offset values. Offset values are calculated at the initial rendering of the screen and do not change with screen resizing'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17810959072412243)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Position At'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'center center'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17782772613967876)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Defines which position of the "target" to align the Inline Dialog against:<br />',
'"horizontal vertical"'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17812758672418488)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>10
,p_display_value=>'center top'
,p_return_value=>'center top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17812406651417451)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>20
,p_display_value=>'center center'
,p_return_value=>'center center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17813205053419285)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>30
,p_display_value=>'center bottom'
,p_return_value=>'center bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17813597614420384)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>40
,p_display_value=>'left top'
,p_return_value=>'left top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17814003945421395)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>50
,p_display_value=>'left center'
,p_return_value=>'left center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17814435527422129)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>60
,p_display_value=>'left bottom'
,p_return_value=>'left bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17814836936422854)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>70
,p_display_value=>'right top'
,p_return_value=>'right top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17815226881423473)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>80
,p_display_value=>'right center'
,p_return_value=>'right center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17815567717424243)
,p_plugin_attribute_id=>wwv_flow_api.id(17810959072412243)
,p_display_sequence=>90
,p_display_value=>'right bottom'
,p_return_value=>'right bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(18001344096106155)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Position At Offset'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17782772613967876)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Given a "Position At" = center center<br />',
'<br />',
'<b>10</b> - would return "center+10 center+10"<br />',
'<b>5% -20</b> - would return "center+5% center-20"'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Each dimension of the position can be given an offset - either in pixels or percentages<br />',
'Percentage offsets are relative to the Target element<br />',
'If only one value is supplied, it will be used for both horizontal and vertical offsets<br />',
'Separate horizontal and vertical offsets with a space character (horizontal vertical)<br />',
'Prefix negative pixel/percentage amounts with a minus sign (do NOT prefix positive numbers)<br />',
'<br />',
'Note: The only space character that is acceptable is _between_ the horizontal and vertical offset values. Offset values are calculated at the initial rendering of the screen and do not change with screen resizing'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(17815963352439854)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Position Of'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(17782772613967876)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<b>#t_PageBody</b> - would allow you to position the inline dialog against the visible edges of the full screen<br />',
'<b>#t_Body_content</b> - position the inline dialog against the main universal theme content area<br />',
'<b>#MYBUTTONID</b> - position the inline dialog against a specific button on a page<br />',
'<br />',
'Note: All jQuery selector types are valid'))
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Enter a valid jQuery selector of the region/item that you wish to position the Inline Dialog against<br />',
'If you provide a selector that matches multiple elements, the first matching element will be used<br />',
'Leaving this attribute empty will mean that the Inline Dialog is opened in the centre of the visible screen regardless of the "My" and "At" selections'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2166756E6374696F6E28742C69297B6B616C634F70656E496E6C696E654469616C6F673D66756E6374696F6E28297B76617220652C612C6E3D746869732C6F3D6E2E616374696F6E2E61747472696275746530312C753D617065782E6974656D286E2E61';
wwv_flow_api.g_varchar2_table(2) := '6374696F6E2E6174747269627574653032292E67657456616C756528292C733D6E2E616374696F6E2E61747472696275746530332C6C3D6E2E616374696F6E2E61747472696275746530382C623D21302C723D6E2E616374696F6E2E6174747269627574';
wwv_flow_api.g_varchar2_table(3) := '6530392C673D6E2E616374696F6E2E61747472696275746531302C643D6E2E616374696F6E2E61747472696275746531312C633D6E2E616374696F6E2E61747472696275746531322C663D6E2E616374696F6E2E61747472696275746531332C783D6E2E';
wwv_flow_api.g_varchar2_table(4) := '616374696F6E2E61747472696275746531342C493D617065782E64656275672E6765744C6576656C28293B6966282259223D3D733F28493E332626617065782E64656275672E696E666F2822496E6C696E65204469616C6F67204944203A222B6F2B223A';
wwv_flow_api.g_varchar2_table(5) := '207769647468206974656D203A222B6E2E616374696F6E2E61747472696275746530362B223A20686569676874206974656D203A222B6E2E616374696F6E2E61747472696275746530372B223A22292C653D7061727365496E7428617065782E6974656D';
wwv_flow_api.g_varchar2_table(6) := '286E2E616374696F6E2E6174747269627574653036292E67657456616C75652829292C613D7061727365496E7428617065782E6974656D286E2E616374696F6E2E6174747269627574653037292E67657456616C7565282929293A28653D706172736549';
wwv_flow_api.g_varchar2_table(7) := '6E74286E2E616374696F6E2E6174747269627574653034292C613D7061727365496E74286E2E616374696F6E2E617474726962757465303529292C493E332626617065782E64656275672E696E666F2822496E6C696E65204469616C6F67204944203A22';
wwv_flow_api.g_varchar2_table(8) := '2B6F2B223A207769647468203A222B652B223A20686569676874203A222B612B223A22292C74282223222B6F292E6469616C6F67287B77696474683A652C6865696768743A617D292C75213D6926262222213D7526262874282223222B6F292E6469616C';
wwv_flow_api.g_varchar2_table(9) := '6F67287B7469746C653A757D292C493E332626617065782E64656275672E696E666F2822496E6C696E65204469616C6F67204944203A222B6F2B223A205469746C65204974656D203A222B6E2E616374696F6E2E61747472696275746530322B223A2056';
wwv_flow_api.g_varchar2_table(10) := '616C7565203A222B752B223A2229292C2266616C7365223D3D6C262628623D2131292C74282223222B6F292E6469616C6F67287B6D6F64616C3A627D292C7226262259223D3D72297B76617220702C442C4F2C682C6D2C503B64213D6926262222213D64';
wwv_flow_api.g_varchar2_table(11) := '3F28642E696E6465784F6628222022293E2D313F28703D642E73756273747228302C642E696E6465784F662822202229292C222D22213D702E73756273747228302C3129262628703D222B222B70292C443D642E736C69636528642E696E6465784F6628';
wwv_flow_api.g_varchar2_table(12) := '222022292B31292C222D22213D442E73756273747228302C3129262628443D222B222B4429293A222D22213D642E73756273747228302C31293F28703D222B222B642C443D222B222B64293A28703D642C443D64292C6D3D672E73756273747228302C67';
wwv_flow_api.g_varchar2_table(13) := '2E696E6465784F662822202229292B702B2220222B672E736C69636528672E696E6465784F6628222022292B31292B44293A6D3D672C66213D6926262222213D663F28662E696E6465784F6628222022293E2D313F284F3D662E73756273747228302C66';
wwv_flow_api.g_varchar2_table(14) := '2E696E6465784F662822202229292C222D22213D4F2E73756273747228302C31292626284F3D222B222B4F292C683D662E736C69636528662E696E6465784F6628222022292B31292C222D22213D682E73756273747228302C3129262628683D222B222B';
wwv_flow_api.g_varchar2_table(15) := '6829293A222D22213D662E73756273747228302C31293F284F3D222B222B662C683D222B222B66293A284F3D662C683D66292C503D632E73756273747228302C632E696E6465784F662822202229292B4F2B2220222B632E736C69636528632E696E6465';
wwv_flow_api.g_varchar2_table(16) := '784F6628222022292B31292B68293A503D632C493E33262628617065782E64656275672E696E666F2822496E6C696E65204469616C6F67204944203A222B6F2B223A20506F736974696F6E204D79203A222B6D2B223A22292C617065782E64656275672E';
wwv_flow_api.g_varchar2_table(17) := '696E666F2822496E6C696E65204469616C6F67204944203A222B6F2B223A20506F736974696F6E204174203A222B502B223A22292C617065782E64656275672E696E666F2822496E6C696E65204469616C6F67204944203A222B6F2B223A20506F736974';
wwv_flow_api.g_varchar2_table(18) := '696F6E204F66203A222B782B223A2229292C742878292E6C656E6774683F74282223222B6F292E6469616C6F67287B706F736974696F6E3A7B6D793A6D2C61743A502C6F663A787D7D293A493E332626617065782E64656275672E696E666F2822496E6C';
wwv_flow_api.g_varchar2_table(19) := '696E65204469616C6F67204944203A222B6F2B223A20506F736974696F6E204F66203A222B782B223A20646F6573206E6F7420657869737420696E2074686520444F4D22297D74282223222B6F292E6469616C6F6728226F70656E22297D7D2861706578';
wwv_flow_api.g_varchar2_table(20) := '2E6A5175657279293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(18166475120801370)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_file_name=>'kalcOpenInlineDialog-min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '4B414C20436F6E73756C74616E6379204C74642D202041504558204F70656E20496E6C696E65204469616C6F67202D2070726F766964656420756E64657220746865204D4954206C6963656E73650D0A0D0A436F6E746163743A206B616C636F6E73756C';
wwv_flow_api.g_varchar2_table(2) := '74616E63796C746440686F746D61696C2E636F6D0D0A76657273696F6E2031202D2031322F31322F323031360D0A5465737465642077697468204F7261636C65204170706C69636174696F6E204578707265737320352E302E340D0A0D0A436F70797269';
wwv_flow_api.g_varchar2_table(3) := '676874202863292032303136204B414C20436F6E73756C74616E6379204C74640D0A0D0A5065726D697373696F6E20697320686572656279206772616E7465642C2066726565206F66206368617267652C20746F20616E7920706572736F6E206F627461';
wwv_flow_api.g_varchar2_table(4) := '696E696E67206120636F70790D0A6F66207468697320736F66747761726520616E64206173736F63696174656420646F63756D656E746174696F6E2066696C657320287468652022536F66747761726522292C20746F206465616C0D0A696E2074686520';
wwv_flow_api.g_varchar2_table(5) := '536F66747761726520776974686F7574207265737472696374696F6E2C20696E636C7564696E6720776974686F7574206C696D69746174696F6E20746865207269676874730D0A746F207573652C20636F70792C206D6F646966792C206D657267652C20';
wwv_flow_api.g_varchar2_table(6) := '7075626C6973682C20646973747269627574652C207375626C6963656E73652C20616E642F6F722073656C6C0D0A636F70696573206F662074686520536F6674776172652C20616E6420746F207065726D697420706572736F6E7320746F2077686F6D20';
wwv_flow_api.g_varchar2_table(7) := '74686520536F6674776172652069730D0A6675726E697368656420746F20646F20736F2C207375626A65637420746F2074686520666F6C6C6F77696E6720636F6E646974696F6E733A0D0A0D0A5468652061626F766520636F70797269676874206E6F74';
wwv_flow_api.g_varchar2_table(8) := '69636520616E642074686973207065726D697373696F6E206E6F74696365207368616C6C20626520696E636C7564656420696E20616C6C0D0A636F70696573206F72207375627374616E7469616C20706F7274696F6E73206F662074686520536F667477';
wwv_flow_api.g_varchar2_table(9) := '6172652E0D0A0D0A54484520534F4654574152452049532050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E59204B494E442C2045585052455353204F520D0A494D504C4945442C20494E434C554449';
wwv_flow_api.g_varchar2_table(10) := '4E4720425554204E4F54204C494D4954454420544F205448452057415252414E54494553204F46204D45524348414E544142494C4954592C0D0A4649544E45535320464F52204120504152544943554C415220505552504F534520414E44204E4F4E494E';
wwv_flow_api.g_varchar2_table(11) := '4652494E47454D454E542E20494E204E4F204556454E54205348414C4C205448450D0A415554484F5253204F5220434F5059524947485420484F4C44455253204245204C4941424C4520464F5220414E5920434C41494D2C2044414D41474553204F5220';
wwv_flow_api.g_varchar2_table(12) := '4F544845520D0A4C494142494C4954592C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C20544F5254204F52204F54484552574953452C2041524953494E472046524F4D2C0D0A4F5554204F46204F5220494E2043';
wwv_flow_api.g_varchar2_table(13) := '4F4E4E454354494F4E20574954482054484520534F465457415245204F522054484520555345204F52204F54484552204445414C494E475320494E205448450D0A534F4654574152452E';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(18196859923846388)
,p_plugin_id=>wwv_flow_api.id(17782523547923199)
,p_file_name=>'kalcOpenInlineDialog-MIT-License.txt'
,p_mime_type=>'text/plain'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
