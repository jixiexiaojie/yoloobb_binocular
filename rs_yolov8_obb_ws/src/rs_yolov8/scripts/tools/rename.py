import os 

def rename_files(path):

    for file_name in os.listdir(path):
        if file_name.endswith(".jpg"):
            # print("file_name:", file_name.split('.')[0])
            new_file_name = "imgs_1_" + file_name.split('.')[0] + ".jpg"
            print("file_name:", new_file_name)
            os.rename(os.path.join(path, file_name), os.path.join(path, new_file_name))

if __name__ == "__main__":
    pic_path = "/media/lenovo/T7 Shield/2d_data/rotate_imgs1/imgs_jpg/"
    rename_files(pic_path)