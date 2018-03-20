
"""
Game AI -- this is for you to complete
"""

import requests
import time
import random


SERVER = "http://127.0.0.1:5000"  # this will not change
TEAM_ID = "HenrikHub2"  # set it to your GitHub username


def reg():
    # register using a fixed team_id
    resp = requests.get(SERVER + "/reg/" + TEAM_ID).json()  # register 1st team

    if resp["response"] == "OK":
        # save which player we are
        print("Registered successfully as Player {}".format(resp["player"]))
        return resp["player"]
    else:

        if resp["error_code"] == 1 or resp["error_code"] == 2:
            print("TEAM_ID var ikke gyldig, vi prøver en gang til, med team navnet : 'SafeTeamID2321'")
            resp = requests.get(SERVER + "/reg/" + "SafeTeamID2321").json()

        elif resp["error_code"] == 3:
            print("Spillet er allerede i gang. Vent til ny omgang!")
            quit()




def play(player):
    game_over = False
    while not game_over:
        time.sleep(0.2)  # wait a bit before making a new status request
        status = requests.get(SERVER + "/status").json()  # request the status of the game
        if status["status_code"] > 300:
            game_over = True
        elif status["status_code"] == 200 + player:  # it's our turn
            print("It's our turn ({}ms left)".format(status["time_left"]))
            # we make a random move => note that this might be an invalid move (segment may be occupied)
            # TODO: figure out a smart move

            if status["last_move"] != "":

                border = []

                lastmove = status["last_move"]
                ##lastmovexy = [int(s) for s in lastmove.split() if s.isdigit()]

                ## Converting list to string
                x = ''.join((lastmove.split(",")[0]))
                y = ''.join((lastmove.split(",")[1]))
                int_x = int(lastmove.split(",")[0])
                int_y = int(lastmove.split(",")[1])

                area = status["board"][int_x][int_y]

                if area < 16:
                    if area == 1 or area == 2 or area == 4 or area == 8:
                        if area == 1:
                            border = ["right","bottom", "left"][random.randint(0,2)]
                        elif area == 2:
                            border = ["top","bottom", "left"][random.randint(0,2)]
                        elif area == 4:
                            border = ["top","right", "left"][random.randint(0,2)]
                        elif area == 8:
                            border = ["top","right", "bottom"][random.randint(0,2)]

                    elif area == 7 or area == 11 or area == 13 or area == 14:
                        if area == 7:
                            border = ["left"]
                        elif area == 11:
                            border = ["bottom"]
                        elif area == 13:
                            border = ["right"]
                        elif area == 14:
                            border = ["top"]

                    print("Making a move: ({},{}) {}".format(x, y, border))
                    move = str(x) + "," + str(y) + "," + border
                    status = requests.get(SERVER + "/move/" + TEAM_ID + "/" + move).json()

                elif area >= 16:

                    minstearea = status["board"].min()
                    xy = status["board"].index(status["board"].min ) ## Posisjonen til det minste tall i matrixen board
                    x = xy[0]
                    y = xy[1]

                    if minstearea == 1 or minstearea == 2 or minstearea == 4 or minstearea == 8:
                        if minstearea == 1:
                            border = ["right", "bottom", "left"][random.randint(0, 2)]
                        elif minstearea == 2:
                            border = ["top", "bottom", "left"][random.randint(0, 2)]
                        elif minstearea == 4:
                            border = ["top", "right", "left"][random.randint(0, 2)]
                        elif minstearea == 8:
                            border = ["top", "right", "bottom"][random.randint(0, 2)]

                    elif minstearea == 7 or minstearea == 11 or minstearea == 13 or minstearea == 14:
                        if minstearea == 7:
                            border = ["left"]
                        elif minstearea == 11:
                            border = ["bottom"]
                        elif minstearea == 13:
                            border = ["right"]
                        elif minstearea == 14:
                            border = ["top"]

                print("Making a move: ({},{}) {}".format(x, y, border))
                move = str(x) + "," + str(y) + "," + border
                status = requests.get(SERVER + "/move/" + TEAM_ID + "/" + move).json()


            else:
                x = random.randint(0,6)
                y = random.randint(0,6)
                border = ["top", "right", "bottom", "left"][random.randint(0,3)]
                print("Making a move: ({},{}) {}".format(x, y, border))
                move = str(x) + "," + str(y) + "," + border
                status = requests.get(SERVER + "/move/" + TEAM_ID + "/" + move).json()


if __name__ == "__main__":
    player = reg()
    play(player)