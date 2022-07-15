<?php

    $allEventsSQL = "SELECT  
        ev.eventId, ev.name, ev.host, ev.email, ev.from_date, ev.until_date, ev.wo, ev.beginn, ev.virtuell, ps.postId, ps.title, ps.subtitle , eS.description as eventstatus, eT.description as eventtype
        FROM events ev 
        LEFT JOIN posts ps ON ev.postId=ps.postId
        LEFT JOIN gatherings gth ON ev.gatheringId=gth.gatheringId
        LEFT JOIN eventtype eT ON gth.eventtypeId=eT.eventtypeId
        LEFT JOIN eventstatus eS ON ev.statusId=eS.statusId
        ORDER BY ev.from_date DESC;";


    $allMeetingsSQL = "SELECT mt.meetingId, mt.date, mt.location, mt.virtuell, mt.description, eS.description AS statusDescription, eS.statusId, ps.postId, ps.posttypeId, ps.title, ps.subtitle, ps.author, eT.eventtypeId, eT.description AS eventtypeDescription, mnts.minutes, tn.Name AS minutesTaker
        FROM meetings mt 
        LEFT JOIN eventstatus eS ON mt.statusTypeId=eS.statusId
        LEFT JOIN gatherings gth ON mt.gatheringId=gth.gatheringId
        LEFT JOIN eventtype eT ON gth.eventtypeId=eT.eventtypeId
        LEFT JOIN posts ps ON ps.postId=mt.postId
        LEFT JOIN `minutes` mnts ON mnts.gatheringId=gth.gatheringId
        LEFT JOIN teilnehmer tn ON mnts.nameId=tn.id
        ORDER BY mt.date DESC;";


    $allProfilesSQL = "SELECT pf.nameId, tn.Name, ps.title, ps.subtitle, media.path AS src, media.alt, media.author AS takenBy, pf.website AS href, pf.website_text, tn.Affiliation
        FROM profile pf
        LEFT JOIN mediainposts mip ON pf.postId=mip.postId
        LEFT JOIN media ON media.mediaId=mip.mediaId
        LEFT JOIN posts ps ON ps.postId=pf.postId
        LEFT JOIN teilnehmer tn ON tn.id=pf.nameId;";

    function getProjectRolesSQL($nameId, $roleTypeId){
        return "SELECT pR.roleId, pR.role, pR.description
        FROM roleassignment rA
        LEFT JOIN projectroles pR ON pR.roleId=rA.roleId
        WHERE rA.nameId=" . $nameId . " AND pR.roleTypeId=" . $roleTypeId . ";";
    }


    function getParticipantsOfEventSQL ($eventid) {
        return "SELECT tn.Name, tn.Affiliation
            FROM events ev
            INNER JOIN gatherings gth ON gth.gatheringId=ev.gatheringId
            INNER JOIN participation pc on gth.gatheringId=pc.gatheringId
            INNER JOIN teilnehmer tn on pc.nameId=tn.id
            WHERE ev.eventId=" . $eventid . ";";
    }

    function getParticipantsOfMeetingSQL ($meetingid) {
        return "SELECT tn.Name, tn.Affiliation
            FROM meetings mt
            INNER JOIN gatherings gth ON gth.gatheringId=mt.gatheringId
            INNER JOIN participation pc on gth.gatheringId=pc.gatheringId
            INNER JOIN teilnehmer tn on pc.nameId=tn.id
            WHERE mt.meetingId=" . $meetingid . ";";
    }

    function getParagraphsOfEventSQL ($eventid) {
        return "SELECT 
            prgph.postId, prgph.text, prgph.ordinal
            FROM events ev
            INNER JOIN paragraphs prgph ON ev.postId=prgph.postId
            WHERE ev.eventId=" . $eventid . " 
            ORDER BY prgph.ordinal ASC;";
    }

    function getParagraphsOfMeetingSQL ($meetingid) {
        return "SELECT 
            prgph.postId, prgph.text, prgph.ordinal
            FROM meetings mt
            INNER JOIN paragraphs prgph ON mt.postId=prgph.postId
            WHERE mt.meetingId=" . $meetingid .  
            " ORDER BY prgph.ordinal ASC;";
    }

    function getImagesOfPostSQL ($postid) {
        $mediatypeId = 1;
        return "SELECT md.path, md.author, md.alt
            FROM posts ps
            INNER JOIN mediainposts mIP ON ps.postId=mIP.postId
            INNER JOIN media md ON md.mediaId=mIP.mediaId
            WHERE ps.postId=" . $postid . " AND md.mediatypeId=" . $mediatypeId . ";";
    }

?>