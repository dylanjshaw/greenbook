
module VoteableHelpers
    def count_votes
        votes.reduce {|sum, vote| sum + vote.value }
    end
end


helpers VoteableHelpers