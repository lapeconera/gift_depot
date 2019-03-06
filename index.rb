require "colorize"
class Gift

    attr_accessor :login,:qna,:the_gift

    def initialize
        @security = []
        @questions = {}
        @gifts = []
    end

    def login
        s_file = File.open("security.txt","r")
        while val = s_file.gets
            @security << val.chomp
        end
        s_file.close
        i = 1
        while i <= 4
            puts "                                                                   ".colorize(:color => :white, :background => :blue)
            puts "             Please enter your username and password               ".colorize(:color => :white, :background => :blue)
            puts "                                                                   ".colorize(:color => :white, :background => :blue)
            puts "                                                                   ".colorize(:color => :white, :background => :blue)
            if i > 1
                puts "                                                                   ".colorize(:color => :white, :background => :red)
                puts "                                                      Attempt #{i}/3  ".colorize(:color => :white, :background => :red)
                puts "                                                                   ".colorize(:color => :white, :background => :red)
            end
            puts "Username required"
            u_name = gets.chomp
            puts "\n"
            puts "Password required"
            pass = gets.chomp
            puts "\n"
            i += 1
            if u_name == @security[0] and pass == @security[1]
                #true
                puts "welcome #{@security[0]}, how are you today?"
                qna

            elsif i >= 4
                # security question needed
                print "Please answer your security your first question"
                puts "\n"
                puts "\n"
                print @security[2]
                puts "\n"
                puts "\n"
                puts "Enter your answer"
                a1 = gets.chomp
                if a1 == @security[3]
                    print "Please answer your security your second question"
                    puts "\n"
                    puts "\n"
                    print @security[4]
                    puts "\n"
                    puts "\n"
                    puts "Enter your answer"
                    a2 = gets.chomp
                    if a2 == @security[5]
                        puts "\n"
                        puts "\n"
                        puts "                /()()()\\\\\\\\*"
                        puts "      =======()()()()()\\\\\\\\\*"
                        puts "            ()           \\\\\\\\\\\*"
                        puts "            ()(*)    _/      \\\\\\\\\\\*"
                        puts "            \\    /  \\      \\\\\\\\\\__________________"
                        puts "                |  |   |       </                ()\\\\\\\\\\\\\\\\\\\*"
                        puts "                o_|   /        /                    \\\\\\\ \\\\\\\\\\    \\\\\\\\\\\\\\\*"
                        puts "                    |  ._    (                      \\\\\\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\*"
                        puts "                    | /                       /       /    \\\\\\\\\\\\\\\    \\\\\\\\\*"
                        puts "            .______/\/     /                 /       /         \\\\\\\\\\\\*"
                        puts "            / __.____/    _/     __________()       /\\\*"
                        puts "           / / / ________/`---------`         \\     /  \\\_*"
                        puts "          / /  \\\ \\\                            \\   \\ \\_  \\\*"
                        puts "         ( <    \\\ \\\                             >  /    \\\ \\\*"
                        puts "          \\/      \\\\\_                          / /       > )*"
                        puts "                  \\\_|                        / /       / /*"
                        puts "                                             / /       / /*"
                        puts "                                             /_|       /_|*"
                        puts "\n"
                        print "reCAPTCHA Human/Robot test: #{@security[6]}"
                        puts "\n"
                        puts "\n"
                        puts "Enter your answer"
                        a3 = gets.chomp
                        if a3 == @security[7]
                            #true
                            puts "welcome #{@security[0]}, how are you today?"
                            qna
                        else
                            puts "Goodbye"
                            exit
                        end
                    else
                        puts "Goodbye"
                        exit
                    end
                else
                    puts "Goodbye"
                        exit
                end                
            end      
        end
    end

    def qna
        q_file = File.open("questions.txt","r")
        while q_val = q_file.gets
            x = q_val.chomp
            spl = x.split(',')
            @questions[spl[0]] = spl[1]
        end
        q_file.close
        #question 1
        puts "\n"
        puts @questions['q1']
        puts "\n"
        print "Please enter the number of your answer"
        puts "\n"
        puts "\n"
        puts @questions['a1']
        answer1 = gets.chomp
        #if wrong char
        until answer1.match?(/[1-5]/) && answer1.length == 1
            puts "\n"
            puts "\n"
            print "Input error! Please enter a number from 1 to 5".colorize(:color => :white, :background => :red)
            puts "\n"
            puts "\n"
            puts @questions['q1']
            puts "\n"
            print "Please enter the number of your answer"
            puts "\n"
            puts "\n"
            puts @questions['a1']
            answer1 = gets.chomp
        end

        ad1 = "a_#{answer1}"
        a1 = @questions[ad1]
        #question2
        puts "\n"
        puts @questions['q2']
        puts "\n"
        print "Please enter the number of your answer"
        puts "\n"
        puts "\n"
        puts @questions['a2']
        answer2 = gets.chomp
        #if wrong char
        until answer2.match?(/[1-5]/) && answer2.length == 1
            puts "\n"
            puts "\n"
            print "Input error! Please enter a number from 1 to 5".colorize(:color => :white, :background => :red)
            puts "\n"
            puts "\n"
            puts @questions['q2']
            puts "\n"
            print "Please enter the number of your answer"
            puts "\n"
            puts "\n"
            puts @questions['a2']
            answer2 = gets.chomp
        end
        ad2 = "b_#{answer2}"
        a2 = @questions[ad2]
        #question3
        puts "\n"
        puts @questions['q3']
        puts "\n"
        print "Please enter the number of your answer"
        puts "\n"
        puts "\n"
        puts @questions['a3']
        answer3 = gets.chomp
        #if wrong char
        until answer3.match?(/[1-5]/) && answer3.length == 1
            puts "\n"
            puts "\n"
            print "Input error! Please enter a number from 1 to 5".colorize(:color => :white, :background => :red)
            puts "\n"
            puts "\n"
            puts @questions['q3']
            puts "\n"
            print "Please enter the number of your answer"
            puts "\n"
            puts "\n"
            puts @questions['a3']
            answer3 = gets.chomp
        end
        ad3= "c_#{answer3}"
        a3 = @questions[ad3]
        p answers = [a1,a2,a3]
        the_gift(answers)
    end

    def the_gift(arr_answers)
        #loop and string reference
        g_file = File.open("gifts.txt","r")
        while g_val = g_file.gets
            @gifts << g_val.chomp
        end
        g_file.close
        #break gifts array into individual arrays
        gifts_length = @gifts.length
        #map
        @gifts.map! do |v|
            v.split(',')
        end
        if arr_answers.include? "hater"
            a = 0
            while a < gifts_length
                if @gifts[a][1..8].include? "hater"
                    puts "\n"
                    puts "\n"
                    puts "Gift Suggestion Depot's gift reccomendation:"
                    puts "\n"
                    puts "Gift name: #{@gifts[a][10]}"
                    puts "Gift Description: #{@gifts[a][11]}"
                    sleep(2)
                    system("open #{@gifts[0][12]}")
                    
                    #another gift?
                    puts "\n"
                    puts "\n"
                    puts "Would you like to try again?"
                    qna
                end
                a += 1
            end                
        else
            a = 0
            while a < gifts_length
                arr_answers.each do |a_val|
                    if @gifts[a][1..8].include? a_val
                        @gifts[a][13] = @gifts[a][13].to_i + 1
                    end
                end
                a += 1
            end
            x = 0
            while x < gifts_length
                if @gifts[x][13].to_i >= 3
                    puts "\n"
                    puts "\n"
                    puts "Gift Suggestion Depot's gift reccomendation:"
                    puts "\n"
                    puts "Gift name: #{@gifts[x][10]}"
                    puts "Gift Description: #{@gifts[x][11]}"
                    sleep(2)
                    system("open #{@gifts[0][12]}")
                    
                    #another gift?
                    puts "\n"
                    puts "\n"
                    puts "Would you like to try again?"
                    qna
                end
                x += 1
            end
        end
    end
end
prompt = Gift.new
#welcome massage
puts "                                                                   ".colorize(:color => :white, :background => :blue)
puts "                                                                   ".colorize(:color => :white, :background => :blue)
puts "              Welcome to the GIFT SUGGESTION DEPOT                 ".colorize(:color => :white, :background => :blue)
prompt.login

# ########################end#############################
# #r.sickle@protonmail.com

# each answer has hash with keys and values

# store all answers in a single array

# each gift has an array with values "string reference"

# #loop through and match array with answers against the gift array 

# sum each gift into a variable g1 g2 g3 g4 g5



