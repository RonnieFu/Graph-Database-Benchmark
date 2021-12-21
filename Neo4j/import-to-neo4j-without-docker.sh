set -e
set -o pipefail


    neo4j-admin import \
    --id-type=INTEGER \
    --nodes:Place="$NEO4J_HOME/import/static/place${NEO4J_CSV_POSTFIX}" \
    --nodes:Organisation="$NEO4J_HOME/import/static/organisation${NEO4J_CSV_POSTFIX}" \
    --nodes:TagClass="$NEO4J_HOME/import/static/tagclass${NEO4J_CSV_POSTFIX}" \
    --nodes:Tag="$NEO4J_HOME/import/static/tag${NEO4J_CSV_POSTFIX}" \
    --nodes:Comment:Message="$NEO4J_HOME/import/dynamic/comment${NEO4J_CSV_POSTFIX}" \
    --nodes:Forum="$NEO4J_HOME/import/dynamic/forum${NEO4J_CSV_POSTFIX}" \
    --nodes:Person="$NEO4J_HOME/import/dynamic/person${NEO4J_CSV_POSTFIX}" \
    --nodes:Post:Message="$NEO4J_HOME/import/dynamic/post${NEO4J_CSV_POSTFIX}" \
    --relationships:IS_PART_OF="$NEO4J_HOME/import/static/place_isPartOf_place${NEO4J_CSV_POSTFIX}" \
    --relationships:IS_SUBCLASS_OF="$NEO4J_HOME/import/static/tagclass_isSubclassOf_tagclass${NEO4J_CSV_POSTFIX}" \
    --relationships:IS_LOCATED_IN="$NEO4J_HOME/import/static/organisation_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_TYPE="$NEO4J_HOME/import/static/tag_hasType_tagclass${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_CREATOR="$NEO4J_HOME/import/dynamic/comment_hasCreator_person${NEO4J_CSV_POSTFIX}" \
    --relationships:IS_LOCATED_IN="$NEO4J_HOME/import/dynamic/comment_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
    --relationships:REPLY_OF="$NEO4J_HOME/import/dynamic/comment_replyOf_comment${NEO4J_CSV_POSTFIX}" \
    --relationships:REPLY_OF="$NEO4J_HOME/import/dynamic/comment_replyOf_post${NEO4J_CSV_POSTFIX}" \
    --relationships:CONTAINER_OF="$NEO4J_HOME/import/dynamic/forum_containerOf_post${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_MEMBER="$NEO4J_HOME/import/dynamic/forum_hasMember_person${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_MODERATOR="$NEO4J_HOME/import/dynamic/forum_hasModerator_person${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_TAG="$NEO4J_HOME/import/dynamic/forum_hasTag_tag${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_INTEREST="$NEO4J_HOME/import/dynamic/person_hasInterest_tag${NEO4J_CSV_POSTFIX}" \
    --relationships:IS_LOCATED_IN="$NEO4J_HOME/import/dynamic/person_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
    --relationships:KNOWS="$NEO4J_HOME/import/dynamic/person_knows_person${NEO4J_CSV_POSTFIX}" \
    --relationships:LIKES="$NEO4J_HOME/import/dynamic/person_likes_comment${NEO4J_CSV_POSTFIX}" \
    --relationships:LIKES="$NEO4J_HOME/import/dynamic/person_likes_post${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_CREATOR="$NEO4J_HOME/import/dynamic/post_hasCreator_person${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_TAG="$NEO4J_HOME/import/dynamic/comment_hasTag_tag${NEO4J_CSV_POSTFIX}" \
    --relationships:HAS_TAG="$NEO4J_HOME/import/dynamic/post_hasTag_tag${NEO4J_CSV_POSTFIX}" \
    --relationships:IS_LOCATED_IN="$NEO4J_HOME/import/dynamic/post_isLocatedIn_place${NEO4J_CSV_POSTFIX}" \
    --relationships:STUDY_AT="$NEO4J_HOME/import/dynamic/person_studyAt_organisation${NEO4J_CSV_POSTFIX}" \
    --relationships:WORK_AT="$NEO4J_HOME/import/dynamic/person_workAt_organisation${NEO4J_CSV_POSTFIX}" \
    --delimiter ','
