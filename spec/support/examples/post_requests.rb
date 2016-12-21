shared_examples_for "valid_create" do |model, redirect, amount|
  it "should be successful" do
    expect{process :create, params: {model => attributes_for(model)} }.to change(model.to_s.classify.constantize, :count).by(amount)
  end

  it "should set success flash messages" do
    process :create, params: {model => attributes_for(model)}

    expect(flash[:success]).to_not be_nil
  end

  it "should redirect to #{redirect}" do
    process :create, params: {model => attributes_for(model)}

    expect(response).to redirect_to(send(redirect))
  end
end

shared_examples_for "invalid_create" do |model, params|
  it "should be rejected" do
    expect{process :create, params: params}.to_not change(model.to_s.classify.constantize, :count)
  end

  it "should set danger flash messages" do
    process :create, params: params

    expect(flash[:danger]).to_not be_nil
  end

  it "should not redirect" do
    process :create, params: params

    assert_response :success
  end
end

shared_examples_for "valid_update" do |model, params, redirect|

  it "should be successful" do
    process :update, params: { id: checked.id, model => params }
    checked.reload
    params.keys.each do |k|
      next if k.to_s.match(/password/)
      expect(checked.send(k)).to eq(params[k])
    end
  end

  it "should set success flash messages" do
    process :update, params: {id: checked.id, model => params}

    expect(flash[:success]).to_not be_nil
  end

  it "should redirect to #{redirect}" do
    process :update, params: { id: checked.id, model => params }

    expect(response).to redirect_to(send(redirect, checked.id))
  end
end

shared_examples_for "invalid_update" do |model, params|
  it "should be rejected" do
    before = checked
    process :update, params: { id: checked.id, model => params }
  end

  it "should set danger flash messages" do
    process :update, params: {id: checked.id, model => params }

    expect(flash[:danger]).to_not be_nil
  end

  it "should not redirect" do
    process :update, params: { id: checked.id, model => params }

    assert_response :success
  end
end

shared_examples_for "unauthorized_update" do |model, params|
  it "should be rejected" do
    before = checked
    process :update, params: { id: checked.id, model => params }
  end

  it "should set danger flash messages" do
    process :update, params: {id: checked.id, model => params }

    expect(flash[:danger]).to_not be_nil
  end

  it "should redirect" do
    process :update, params: { id: checked.id, model => params }

    assert_response :redirect
  end
end
