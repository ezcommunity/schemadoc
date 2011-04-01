
alter table ezbasket add foreign key(order_id) references ezorder(id);
alter table ezbasket add foreign key(productcollection_id) references ezproductcollection(id);
alter table ezbinaryfile add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezcobj_state add foreign key(group_id) references ezcobj_state_group(id);
alter table ezcobj_state_group_language add foreign key(contentobject_state_group_id) references ezcobj_state_group(id);
alter table ezcobj_state_language add foreign key(contentobject_state_id) references ezcobj_state(id);
alter table ezcollab_group add foreign key(parent_group_id) references ezcollab_group(id);
alter table ezcollab_group add foreign key(user_id) references ezuser(contentobject_id);
alter table ezcollab_item add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezcollab_item_group_link add foreign key(collaboration_id) references ezcollab_item(id);
alter table ezcollab_item_group_link add foreign key(group_id) references ezcollab_group(id);
alter table ezcollab_item_group_link add foreign key(user_id) references ezuser(contentobject_id);
alter table ezcollab_item_message_link add foreign key(collaboration_id) references ezcollab_item(id);
alter table ezcollab_item_message_link add foreign key(message_id) references ezcollab_simple_message(id);
alter table ezcollab_item_message_link add foreign key(participant_id) references ezuser(contentobject_id);
alter table ezcollab_item_participant_link add foreign key(collaboration_id) references ezcollab_item(id);
alter table ezcollab_item_participant_link add foreign key(participant_id) references ezcontentobject(id);
alter table ezcollab_item_status add foreign key(collaboration_id) references ezcollab_item(id);
alter table ezcollab_item_status add foreign key(user_id) references ezuser(contentobject_id);
-- alter table ezcollab_notification_rule add foreign key(user_id) references ezuser(contentobject_id); -- ERROR 1005
alter table ezcollab_profile add foreign key(main_group) references ezcollab_group(id);
alter table ezcollab_profile add foreign key(user_id) references ezuser(contentobject_id);
alter table ezcollab_simple_message add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezcontentbrowsebookmark add foreign key(node_id) references ezcontentobject_tree(node_id);
alter table ezcontentbrowsebookmark add foreign key(user_id) references ezuser(contentobject_id);
alter table ezcontentbrowserecent add foreign key(node_id) references ezcontentobject_tree(node_id);
alter table ezcontentbrowserecent add foreign key(user_id) references ezuser(contentobject_id);
alter table ezcontentclass add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezcontentclass add foreign key(initial_language_id) references ezcontent_language(id);
alter table ezcontentclass add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezcontentclass_attribute add foreign key(contentclass_id) references ezcontentclass(id);
alter table ezcontentclass_classgroup add foreign key(contentclass_id) references ezcontentclass(id);
alter table ezcontentclassgroup add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezcontentclassgroup add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezcontentclass_name add foreign key(contentclass_id) references ezcontentclass(id);
-- alter table ezcontentclass_name add foreign key(language_id) references ezcontent_language(id); -- ERROR 1452
alter table ezcontentobject add foreign key(contentclass_id) references ezcontentclass(id);
alter table ezcontentobject add foreign key(initial_language_id) references ezcontent_language(id);
alter table ezcontentobject add foreign key(owner_id) references ezuser(contentobject_id);
alter table ezcontentobject add foreign key(section_id) references ezsection(id);
-- alter table ezcontentobject_attribute add foreign key(attribute_original_id) references ezcontentobject_attribute(id); -- ERROR 1452
alter table ezcontentobject_attribute add foreign key(contentclassattribute_id) references ezcontentclass_attribute(id);
alter table ezcontentobject_attribute add foreign key(contentobject_id) references ezcontentobject(id);
-- alter table ezcontentobject_attribute add foreign key(language_id) references ezcontent_language(id); -- ERROR 1452
alter table ezcontentobject_trash add foreign key(contentobject_id) references ezcontentobject(id);
-- alter table ezcontentobject_tree add foreign key(contentobject_id) references ezcontentobject(id); -- ERROR 1452
alter table ezcontentobject_tree add foreign key(main_node_id) references ezcontentobject_tree(node_id);
alter table ezcontentobject_tree add foreign key(parent_node_id) references ezcontentobject_tree(node_id);
alter table ezcontentobject_version add foreign key(contentobject_id) references ezcontentobject(id);
-- alter table ezcontentobject_version add foreign key(creator_id) references ezuser(id); -- ERROR 1005
alter table ezcontentobject_version add foreign key(initial_language_id) references ezcontent_language(id);
-- alter table ezcontentobject_version add foreign key(user_id) references ezuser(contentobject_id); -- ERROR 1452
alter table ezdiscountsubrule add foreign key(discountrule_id) references ezdiscountrule(id);
alter table ezdiscountsubrule_value add foreign key(discountsubrule_id) references ezdiscountsubrule(id);
alter table ezenumobjectvalue add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezenumvalue add foreign key(contentclass_attribute_id) references ezcontentclass_attribute(id);
alter table ezenumvalue add foreign key(contentclass_attribute_id) references ezcontentobject_attribute(id);
alter table ezforgot_password add foreign key(user_id) references ezuser(contentobject_id);
alter table ezgmaplocation add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezimagefile add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezinfocollection add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezinfocollection add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezinfocollection_attribute add foreign key(contentclass_attribute_id) references ezcontentclass_attribute(id);
alter table ezinfocollection_attribute add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezinfocollection_attribute add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezinfocollection_attribute add foreign key(informationcollection_id) references ezinfocollection(id);
alter table ezisbn_registrant_range add foreign key(isbn_group_id) references ezisbn_group(id);
alter table ezmedia add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezm_pool add foreign key(block_id) references ezm_block(id);
alter table ezm_pool add foreign key(moved_to) references ezm_block(id);
alter table ezmultipricedata add foreign key(contentobject_attr_id) references ezcontentobject_attribute(id);
-- alter table eznode_assignment add foreign key(contentobject_id) references ezcontentobject(id); -- ERROR 1452
-- alter table eznode_assignment add foreign key(from_node_id) references ezcontentobject_tree(node_id); -- ERROR 1452
alter table eznode_assignment add foreign key(parent_node) references ezcontentobject_tree(node_id);
alter table eznotificationcollection add foreign key(event_id) references eznotificationevent(id);
alter table eznotificationcollection_item add foreign key(collection_id) references eznotificationcollection(id);
alter table eznotificationcollection_item add foreign key(event_id) references eznotificationevent(id);
alter table ezoperation_memento add foreign key(main_key) references ezoperation_memento(memento_key);
alter table ezorder add foreign key(productcollection_id) references ezproductcollection(id);
alter table ezorder add foreign key(status_id) references ezorder_status(id);
alter table ezorder add foreign key(status_modifier_id) references ezuser(contentobject_id);
alter table ezorder add foreign key(user_id) references ezuser(contentobject_id);
alter table ezorder_item add foreign key(order_id) references ezorder(id);
alter table ezorder_status_history add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezorder_status_history add foreign key(order_id) references ezorder(id);
alter table ezorder_status_history add foreign key(status_id) references ezorder_status(id);
alter table ezpaymentobject add foreign key(order_id) references ezorder(id);
alter table ezpaymentobject add foreign key(workflowprocess_id) references ezworkflow_process(id);
alter table ezpolicy add foreign key(role_id) references ezrole(id);
alter table ezpolicy_limitation add foreign key(policy_id) references ezpolicy(id);
alter table ezpolicy_limitation_value add foreign key(limitation_id) references ezpolicy_limitation(id);
alter table ezproductcollection_item add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezproductcollection_item add foreign key(productcollection_id) references ezproductcollection(id);
alter table ezproductcollection_item_opt add foreign key(item_id) references ezproductcollection_item(id);
alter table ezproductcollection_item_opt add foreign key(object_attribute_id) references ezcontentobject_attribute(id);
alter table ezproductcollection_item_opt add foreign key(option_item_id) references ezproductcollection_item_opt(id);
alter table ezrss_export_item add foreign key(class_id) references ezcontentclass(id);
-- alter table ezrss_export_item add foreign key(source_node_id) references ezcontentobject_tree(node_id); -- ERROR 1452
alter table ezrss_import add foreign key(class_id) references ezcontentclass(id);
alter table ezrss_import add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezrss_import add foreign key(destination_node_id) references ezcontentobject_tree(node_id);
alter table ezrss_import add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezrss_import add foreign key(object_owner_id) references ezuser(contentobject_id);
alter table ezsubtree_notification_rule add foreign key(node_id) references ezcontentobject_tree(node_id);
alter table ezsubtree_notification_rule add foreign key(user_id) references ezuser(contentobject_id);
alter table eztipafriend_counter add foreign key(node_id) references ezcontentobject_tree(node_id);
alter table eztrigger add foreign key(workflow_id) references ezworkflow(id);
alter table ezurl_object_link add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezurl_object_link add foreign key(url_id) references ezurl(id);
alter table ezuser_accountkey add foreign key(user_id) references ezuser(contentobject_id);
alter table ezuser add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezuser_discountrule add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezuser_discountrule add foreign key(discountrule_id) references ezdiscountrule(id);
alter table ezuser_setting add foreign key(user_id) references ezuser(contentobject_id);
alter table ezvatrule add foreign key(vat_type) references ezvattype(id);
alter table ezview_counter add foreign key(node_id) references ezcontentobject_tree(node_id);
alter table ezwaituntildatevalue add foreign key(contentclass_attribute_id) references ezcontentclass_attribute(id);
alter table ezwaituntildatevalue add foreign key(contentclass_id) references ezcontentclass(id);
alter table ezwaituntildatevalue add foreign key(workflow_event_id) references ezworkflow_event(id);
alter table ezwishlist add foreign key(productcollection_id) references ezproductcollection(id);
alter table ezwishlist add foreign key(user_id) references ezuser(contentobject_id);
alter table ezworkflow add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezworkflow add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezworkflow_event add foreign key(workflow_id) references ezworkflow(id);
alter table ezworkflow_group add foreign key(creator_id) references ezuser(contentobject_id);
alter table ezworkflow_group add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezworkflow_group_link add foreign key(group_id) references ezworkflow_group(id);
alter table ezworkflow_group_link add foreign key(workflow_id) references ezworkflow(id);
alter table ezworkflow_process add foreign key(memento_key) references ezoperation_memento(memento_key);
alter table ezworkflow_process add foreign key(user_id) references ezuser(contentobject_id);
alter table ezworkflow_process add foreign key(workflow_id) references ezworkflow(id);
alter table ezstarrating_data add foreign key(user_id) references ezuser(contentobject_id);
alter table ezstarrating_data add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezstarrating_data add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);
alter table ezstarrating add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezstarrating add foreign key(contentobject_attribute_id) references ezcontentobject_attribute(id);

-- eZ Publish 4.5.0
alter table ezpublishingqueueprocesses add foreign key(ezcontentobject_version_id) references ezcontentobject_version(id);

