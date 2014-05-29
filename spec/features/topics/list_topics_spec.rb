require 'features_spec_helper'

describe 'Listing Topics', :js do
  context 'on the home page' do
    let(:home_page) { root_path }

    context 'when there are no topics in the system' do
      it 'shows the topics header with no topics' do
        visit home_page
        expect(current_path).to eq root_path
        expect(page).to have_selector('.topics-title', text: I18n.t('topics.index.title'))
        expect(page).not_to have_selector('.topic')
      end
    end

    context 'when there are 3 topics in the system' do
      before do
        Crud::Topics::Create.new(title: 'Topic 1', description: 'First Topic').call
        Crud::Topics::Create.new(title: 'Topic 2', description: 'Second Topic').call
        Crud::Topics::Create.new(title: 'Topic 3', description: 'Third Topic').call
      end

      it 'shows the topics header with 3 topics' do
        visit home_page
        expect(current_path).to eq root_path
        expect(page).to have_selector('.topics-title', text: I18n.t('topics.index.title'))
        expect(page).to have_selector('.topic', text: 'Topic 1')
        expect(page).to have_selector('.topic', text: 'Topic 2')
        expect(page).to have_selector('.topic', text: 'Topic 3')
      end
    end
  end
end