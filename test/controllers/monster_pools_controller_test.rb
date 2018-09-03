require 'test_helper'

class MonsterPoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_pool = monster_pools(:one)
  end

  test "should get index" do
    get monster_pools_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_pool_url
    assert_response :success
  end

  test "should create monster_pool" do
    assert_difference('MonsterPool.count') do
      post monster_pools_url, params: { monster_pool: {  } }
    end

    assert_redirected_to monster_pool_url(MonsterPool.last)
  end

  test "should show monster_pool" do
    get monster_pool_url(@monster_pool)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_pool_url(@monster_pool)
    assert_response :success
  end

  test "should update monster_pool" do
    patch monster_pool_url(@monster_pool), params: { monster_pool: {  } }
    assert_redirected_to monster_pool_url(@monster_pool)
  end

  test "should destroy monster_pool" do
    assert_difference('MonsterPool.count', -1) do
      delete monster_pool_url(@monster_pool)
    end

    assert_redirected_to monster_pools_url
  end
end
