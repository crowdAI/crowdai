module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      tutorial_rules
      upvote_rules
      submission_rules
    end

    def submission_rules
      # bronze
      #grant_on ['submissions#create','api/external_graders#create'], badge: 'submission-bronze'
      grant_on ['submissions#create'], badge: 'submission-bronze'

      # silver
      # grant_on ['submissions#create','api/external_graders#create'], badge: 'submission-silver', to: :participant
      grant_on ['submissions#create'], badge: 'submission-silver', to: :participant do |submission|
        submission.participant.submissions.count >= 100
      end

      # gold
      #grant_on ['submissions#create','api/external_graders#create']
      grant_on ['submissions#create'], badge: 'submission-gold', to: :participant do |submission|
        submission.participant.submissions.count >= 1000
      end
    end

    def upvote_rules
      # bronze
      grant_on ['votes#create','votes#destroy'], badge: 'upvote-bronze'

      # silver
      grant_on ['votes#create','votes#destroy'], badge: 'upvote-silver', to: :participant do |vote|
        vote.participant.votes.count >= 25
      end

      # gold
      grant_on ['votes#create','votes#destroy'], badge: 'upvote-gold', to: :participant do |vote|
        vote.participant.votes.count >= 250
      end
    end

    def tutorial_rules
      # Authored a tutorial
      # bronze
      grant_on ['articles#create','articles#update'], badge: 'tutorial-bronze', to: :participant do |article|
        article.published?
      end

      # silver
      grant_on ['articles#create','articles#update'], badge: 'tutorial-silver', to: :participant do |article|
        published_articles = Article.where(
          participant: article.participant,
          published: true)
        published_articles.count >= 3
      end

      # gold
      grant_on ['articles#create','articles#update'], badge: 'tutorial-gold', to: :participant do |article|
        published_articles = Article.where(
          participant: article.participant,
          published: true)
        published_articles.count >= 30
      end
    end

  end
end
