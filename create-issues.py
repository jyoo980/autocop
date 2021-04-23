import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

title_text = "ACTION REQUIRED: REPO VISIBILITY"
body_text = "TODO: fill this in"

def wait(secs):
  time.sleep(secs)

def create_issue(url):
  driver.get(url)
  # Fill in title
  issue_title = driver.find_element_by_id("issue_title")
  issue_title.send_keys(title_text)
  wait(5)
  # Fill in body
  issue_body = driver.find_element_by_id("issue_body")
  issue_body.send_keys(body_test)
  wait(5)
  # Submit
  submit_button = driver.find_element_by_xpath(
    '//button[normalize-space()="Submit new issue"]'
  )
  submit_button.click()
  

issue_urls = ["TODO: fill this in"]
path_to_user_profile = "/Users/<username>/Library/Application Support/Google/Chrome/"
driver = None

try:
  opts = webdriver.ChromeOptions()
  opts.add_argument(f"--user-data-dir={path_to_user_profile}")
  driver = webdriver.Chrome(options=opts)

  for url in issue_urls:
    create_issue(url)
     # Don't go too fast
    wait(5)

  driver.quit()
except:
  if driver:
    driver.quit()
finally:
  if driver:
    driver.quit()
