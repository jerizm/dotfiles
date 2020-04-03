export const command = "./code/status.sh";

export const refreshFrequency = 10000;

export const render = ({ output }) => {
    const sections = output.split("|");
    const out = sections.map((section, i) => {
        const matches = section.match(/@(.*?)@/g);
        const name = matches ? matches[0].replace(/@/g, "") : null;
        return (
            <span>
                {name && <i className={"fas fa-" + name}></i>}
                {section.trim().replace(/@.*@/, "")}
                {i < sections.length - 1 && <span> | </span>}
            </span>
        );
    });
    return (
        <div>
            <link
                rel="stylesheet"
                type="text/css"
                href="./assets/fontawesome-all.min.css"
            />
            <div className="status">{out}</div>
        </div>
    );
};

export const className = {
    fontFamily: "monaco",
    fontSize: "11px",
    color: "#bebebe",
    right: "18px",
    top: "8px",
    height: 13
};
