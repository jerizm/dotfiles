import { run } from "uebersicht";

export const command = "/usr/local/bin/yabai -m query --spaces";
export const refreshFrequency = 300;
export const render = ({ output }) => {
    if (output) {
        const spaces = JSON.parse(output);
        return (
            <div className="spaces-container" data-count={spaces.length}>
                <ul>{generateIcons(spaces)}</ul>
            </div>
        );
    }
};

function generateIcons(spaces) {
    const displayHash = spaces.reduce((hash, space) => {
        const key = space.display;
        if (!hash[key]) hash[key] = [];
        hash[key].push(space);
        return hash;
    }, {});
    const displays = Object.keys(displayHash).map(k => displayHash[k]);
    let icons = [];
    displays.forEach((display, i) => {
        display.forEach(space => {
            icons.push(
                <li
                    className={space.focused === 1 ? "visible" : ""}
                    key={space.id}
                >
                    <a
                        onClick={() => {
                            run(
                                "/usr/local/bin/yabai -m space --focus " +
                                    space.index
                            );
                        }}
                    >
                        {space.index}
                    </a>
                </li>
            );
        });
        if (i < displays.length - 1) {
            icons.push(<li>—</li>);
        }
    });
    return icons;
}

export const className = {
    position: "relative",
    marginTop: "7px",
    font:
        '14px "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif',
    color: "#aaa",
    fontWeight: 700,
    ul: {
        listStyle: "none",
        margin: "0 0 0 1em",
        padding: 0
    },
    li: {
        display: "inline-block",
        textAlign: "center",
        width: "1em",
        margin: "0 0.5em"
    },
    "li.visible": {
        color: "#ededed",
        borderBottom: "2px solid #ededed"
    }
};
export const updateState = (event, previousState) => {
    if (event.error) {
        return { ...previousState, warning: `We got an error: ${event.error}` };
    }
    if (event.output !== "") {
        return event;
    }
    return previousState;
};
