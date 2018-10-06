module Rules exposing (..)


type alias VotesPerUnit =
    Int


type alias Count =
    Int



-- unfilledVotingRoles Int ?
-- " If a club has not filled a vote-holding officer position, that vote is lost; it may not be transferred to anyone else"
-- https://www.toastmasters.org/-/media/files/department-documents/district-documents/222-district-leadership-handbook.ashx


type alias ClubInfo =
    { members : Count }


type alias District =
    { clubs : Count
    , officers : Count
    , adjustment : Count
    }


type alias AreaInfo =
    { clubs : Count
    , officers : Count
    , adjustment : Count
    }


type VotingBody
    = Club Count
    | DistrictExec District
    | DistCouncil District
    | Area AreaInfo


type QuorumType
    = None
    | Half VotesPerUnit
    | OneThird VotesPerUnit


type alias QuorumBreakdown =
    { club : QuorumType
    , district : QuorumType
    }


type MeetingType
    = ClubMtg QuorumBreakdown
    | DistrictExecComm QuorumBreakdown
    | DistrictCouncil QuorumBreakdown
    | AreaCouncil QuorumBreakdown


clubQuorum =
    ClubMtg { club = Half 1, district = None }


distExecQuorum =
    DistrictExecComm { club = None, district = Half 1 }


distCouncilQuorum =
    DistrictCouncil { club = OneThird 2, district = None }


areaCountilQuorum =
    AreaCouncil { club = Half 3, district = None }


quorumCalc : QuorumBreakdown -> ()
quorumCalc qb =
    --case qb of
    ()


type alias Member =
    { name : String
    }


type Members
    = Count Int
    | Names (List Member)


type alias MemberCount =
    { members : Int
    , vacancyAdjustment : Int
    }


type alias ClubCount =
    { clubs : Int
    , vacancyAdjustment : Int
    }


type alias Officers =
    { district : Members
    , club : Members
    }


eligibleClubVotes clubs =
    clubs * 2


type alias VotingMembers =
    { eligible : Officers
    , present : Officers
    }


type Quorum
    = Rounded Float Int String
    | PlusOne Int Int String


type Majority
    = Simple Quorum
    | TwoThirds Quorum


officerCount : Members -> Int
officerCount m =
    case m of
        Count c ->
            c.members - c.vacancyAdjustment

        Names n ->
            List.length n


quorum : Int -> Quorum
quorum eligible =
    let
        isEven e =
            modBy 2 e == 0

        half =
            toFloat eligible / 2

        p1 =
            floor half + 1

        rndUp =
            ceiling half
    in
        if eligible |> isEven then
            PlusOne (fromFloat half) p1 ((fromFloat half) ++ " + 1 = " ++ (fromInt p1))
        else
            Rounded half rndUp ((fromFloat half) ++ " rounded up = " ++ (fromInt rndUp))
