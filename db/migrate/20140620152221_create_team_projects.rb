class CreateTeamProjects < ActiveRecord::Migration
  def change
    create_table :team_projects do |t|
      t.references :team, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end
