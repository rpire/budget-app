module Mocks
  def generate_user
    @ruben = User.create(
      name: 'Rubén Pire',
      email: 'rubenpire7@gmail.com',
      password: 'iloveburgers'
    )
  end

  def generate_group
    @group = Group.create(
      author_id: @ruben.id,
      name: 'Burger Bar',
      icon: 'burger_bar.png'
    )
  end

  def generate_entity
    @entity = Entity.create(
      author_id: @ruben.id,
      name: 'Big Ugly Burger',
      amount: 4.99
    )

    @group_entity = GroupEntity.create(
      group_id: @group.id,
      entity_id: @entity.id
    )
  end

  def log_in
    visit user_session_path
    fill_in 'Email', with: 'rubenpire7@gmail.com'
    fill_in 'Password', with: 'iloveburgers'
    click_button 'Log in'
  end
end
