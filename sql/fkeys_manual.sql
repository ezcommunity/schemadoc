-- Added by hand because of class definitions failing during auto generating
alter table ezpdf_export add foreign key(source_node_id) references ezcontentobject_tree(node_id);
alter table ezpdf_export add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezpdf_export add foreign key(creator_id) references ezuser(contentobject_id);

alter table ezrss_export add foreign key(modifier_id) references ezuser(contentobject_id);
alter table ezrss_export add foreign key(creator_id) references ezuser(contentobject_id);

-- Associations not defined in kernel classes
alter table ezbasket add foreign key(session_id) references ezsession(session_key);

alter table ezcontentobject_name add foreign key(contentobject_id) references ezcontentobject(id); 

alter table ezcontentobject_link add foreign key(from_contentobject_id) references ezcontentobject(id);
alter table ezcontentobject_link add foreign key(to_contentobject_id) references ezcontentobject(id);

alter table ezcobj_state_link add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezcobj_state_link add foreign key(contentobject_state_id) references ezcobj_state(id);

alter table ezuser_role add foreign key(role_id) references ezrole(id);

alter table ezsearch_object_word_link add foreign key(contentobject_id) references ezcontentobject(id);
alter table ezsearch_object_word_link add foreign key(contentclass_id) references ezcontentclass(id);
alter table ezsearch_object_word_link add foreign key(section_id) references ezsection(id);

alter table ezvatrule_product_category add foreign key(vatrule_id) references ezvatrule(id);
alter table ezvatrule_product_category add foreign key(product_category_id) references ezproductcategory(id);

alter table ezapprove_items add foreign key(collaboration_id) references ezcollab_item(id);
alter table ezapprove_items add foreign key(workflow_process_id) references ezworkflow_process(id);

alter table ezpreferences add foreign key(user_id) references ezuser(contentobject_id);

alter table ezsession add foreign key(user_id) references ezuser(contentobject_id);

alter table ezuservisit add foreign key(user_id) references ezuser(contentobject_id);

alter table ezuser_role add foreign key(contentobject_id) references ezcontentobject_tree(contentobject_id);

-- Associations not defined in extension classes
alter table ezkeyword add foreign key(class_id) references ezcontentclass(id);
alter table ezkeyword_attribute_link add foreign key(keyword_id) references ezkeyword(id);
alter table ezkeyword_attribute_link add foreign key(objectattribute_id) references ezcontentobject_attribute(id);

alter table ezstarrating_data add foreign key(session_key) references ezsession(session_key);

