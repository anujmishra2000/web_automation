class FillForm
  include PageObject
  include DataMagic

  DataMagic.yml_directory = 'C:\Users\anuj2\Desktop\Web-automation\exercise5\features\yml'
  DataMagic.load 'fixtures.yml'

  page_url 'https://docs.google.com/forms/d/e/1FAIpQLScuMA0b08dzZIJbRaW4CpuB5bg1hwfeZSmzFb9oOh1szIZ0pw/viewform?usp=sf_link'
  text_field(:firstname, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[1]/div/div/div[2]/div/div[1]/div/div[1]/input')
  text_field(:lastname, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[2]/div/div/div[2]/div/div[1]/div/div[1]/input')
  Label_Elements = {:xpath => 'custom-control-label'}
  div(:male, :xpath => '//*[@id="i13"]')
  div(:female, xpath: '//*[@id="i16"]')
  text_field(:age, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[4]/div/div/div[2]/div/div[1]/div/div[1]/input')
  text_field(:college, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[5]/div/div/div[2]/div/div[1]/div/div[1]/input')
  text_field(:email, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[6]/div/div/div[2]/div/div[1]/div/div[1]/input')
  text_area(:address, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[7]/div/div/div[2]/div/div[1]/div[2]/textarea')
  text_field(:mobile, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[2]/div[8]/div/div/div[2]/div/div[1]/div/div[1]/input')
  div(:submit, :xpath => '//*[@id="mG61Hd"]/div[2]/div/div[3]/div[1]/div[1]/div')

  def visit
      goto
  end

  def populate_page(user)
      user_data = data_for "fixtures/#{user}"
      populate_page_with user_data

      if user_data['gender'] == 'Male'
        self.male_element.click
      else
        self.female_element.click
      end
  end

  def submit_form
    sleep 2
    submit_element.click
  end
end