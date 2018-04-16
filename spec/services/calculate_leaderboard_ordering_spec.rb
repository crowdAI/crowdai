require 'rails_helper'

RSpec.describe CalculateLeaderboardService do

  let(prim_desc_sec_asc) {
    create :challenge,
      primary_sort_order_cd: 'descending',
      secondary_sort_order_cd: 'ascending' }
  let(prim_desc) {
    create :challenge,
      primary_sort_order_cd: 'descending',
      secondary_sort_order_cd: 'not_used' }
  let(prim_asc_sec_asc) {
    create :challenge,
      primary_sort_order_cd: 'ascending',
      secondary_sort_order_cd: 'ascending' }
  let(prim_asc_sec_desc) {
    create :challenge,
      primary_sort_order_cd: 'ascending',
      secondary_sort_order_cd: 'descending' }
  let(prim_asc) {
    create :challenge,
      primary_sort_order_cd: 'descending',
      secondary_sort_order_cd: 'not_used' }

  it 'primary descending, secondary descending' do
    prim_desc_sec_desc = create :challenge,
        primary_sort_order_cd: 'descending',
        secondary_sort_order_cd: 'descending'
  end





end
