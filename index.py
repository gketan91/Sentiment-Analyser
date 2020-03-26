from flask import Flask
from flask import render_template,request


app=Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/external',methods=['post'])
def external():
    a = ["abysmal","adverseal","arming","angry","annoy","anxious","apathy","appalling","atrocious","awful",
         "bad","banalar","bed","belligerent","bemoan","beneath","boring","broken","callous","can't","clumsy",
         "coarse","cold-hearted","collapse","confused","contradictory","contrary","corrosive","corrupt","crazy",
         "creepy","criminal","cruel","cry","cutting","damage","damaging","dead","decaying","deformed","deny",
         "deplorable","depressed","deprived","despicable","detrimental","dirty","disease","disgusting",
         "disheveled","dishonest","dishonorable","dismal","distress","donot","dreadful","dreary","enrag",
         "ederoding","evil","fail","faulty","fear","feeble","fight","filthy","foul","frighten","frightful",
         "ghastly","grave","greed","grimace","gross","grotesque","gruesome","haggard","hard","hardhearted",
         "harmful","hate","hideous","homely","horrendous","horrible","hostile","hurt","hurtful","icky",
         "ignorant","ignore","ill","immature","imperfect","impossible","inane","inelegant","infernal","injure",
         "injurious","insane","insidious","insipid","jealous","junky","malicious","mean","menacing","messy",
         "misshapen","missing","misunderstood","moanmoldy","monstrous","naive","nasty","naughty","negate",
         "negative","never","nonobody","nondescript","nonsense","not","noxious","objectionable","odious",
         "offensive","old","oppressive","lose","lousy","lumpy","pain","perturb","pessimistic","petty","plain",
         "poisonous","poor","prejudice","questionable","quirky","quit","reject","renege","repellant",
         "reptilian","repugnant","repulsive","revenge","revolting","rocky","rotten","ruderuthless","sad",
         "savage","scare","scary","scream","severe","shocking","shoddy","sick","sickening","sinister","slimy",
         "smelly","sobbing","sorry","spiteful","sticky","stinky","stormy","stressful","stuck","stupid",
         "substandard","suspect","suspicious","tense","terrible","terrifying","threatening","ugly","undermine",
         "unfair","unfavorable","unhappy","unhealthy","unjust","unlucky","unpleasant","unsatisfactory",
         "unsightly","untoward","unwanted","unwelcome","unwholesome","unwieldy","unwise","upset","vice",
         "vicious","vile","villainous","vindictive","waryweary","wicked","woeful","worthless","wound","yell",
         "yucky","zero"]
    try:
        c=request.form.get("t1")
        b=[c]
        for i in b:
            for j in a:
                if j in i:
                    d="Negative"
                    break
                else:
                    d="Positive"
    except Exception as e:
        pass
    return render_template("index.html",b=b,d=d,a=a)

if __name__=='__main__':
    app.run(debug=True)