# UnlockEdgePolicies - pretend to be in MDM
This is a simple script to allow users configuring policies for Microsoft Edge locked to MDM environments. You may now set a default search engine & change the new tab page and more!

![image](https://github.com/user-attachments/assets/1d2d7f9d-08a4-4b38-83d2-8360d4896762)


The solution was taken from a blog @ [hitco.at](https://hitco.at) ([link to the blog post](https://hitco.at/blog/apply-edge-policies-for-non-domain-joined-devices/)). I have tested it on LTSC 2019, LTSC 2021 and LTSC 2024.

## Usage:
1. Download and run the script **AS ADMINISTRATOR** from [releases](https://github.com/PearPony/UnlockEdgePolicies/releases) or source;
2. Choose the apply option (or revert if you want to revert the changes). Restart your computer afterwards;
4. Go to the [Microsoft Edge for Business page](https://www.microsoft.com/en-us/edge/business/download), obtain policy templates for your architecture;
5. Extract the archive from the cabinet, then extract the archive;
6. Open Group Policy Editor, under "Computer Configuration" select "Administrative Templates". Then proceed to click the "Action" button on the top of the window and press "Add/Remove Templates...";
7. Press "Add" then go to the path you've extracted the archive in, "windows", "adm", select your language and select the "msedge.adm" file;
8. You will now have "Classic Administrative Templates (ADM)" in "Administrative Templates". In there you will find Microsoft Edge policies;
9. Happy editing!
