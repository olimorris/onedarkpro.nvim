<template>
    <div class="relative inline-flex h-auto">
        <!-- overlay -->
        <div
            class="z-20 fixed w-screen h-screen bg-transparent top-0 left-0"
            v-if="showDropdown"
            @click.prevent="closeDropdown"
        >
            &nbsp;
        </div>
        <button
            :disabled="disabled"
            @click="openDropdown"
            :class="inputClass(index)"
            class="inline-block h-6 overflow-hidden overflow-ellipsis w-full px-1.5 pr-4 text-left bg-gray-200 rounded-md appearance-none text-2xs focus:outline-none focus:ring-purple-light focus:ring-1 disabled:text-gray-400 border border-gray-300 whitespace-pre"
        >
            <div class="flex items-center space-x-1">
                <div v-if="!isValid">
                    <svg
                        width="4"
                        height="14"
                        viewBox="0 0 3 13"
                        fill="currentColor"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            fill-rule="evenodd"
                            clip-rule="evenodd"
                            d="M1.5 0C0.671573 0 0 0.671574 0 1.5V7.5C0 8.32843 0.671573 9 1.5 9C2.32843 9 3 8.32843 3 7.5V1.5C3 0.671574 2.32843 0 1.5 0ZM1.5 10C0.671573 10 0 10.6716 0 11.5C0 12.3284 0.671573 13 1.5 13C2.32843 13 3 12.3284 3 11.5C3 10.6716 2.32843 10 1.5 10Z"
                            fill="#C10707"
                        />
                    </svg>
                </div>
                <div class="overflow-ellipsis overflow-hidden">{{ value }}</div>
            </div>

            <div
                :class="disabled ? 'text-gray-400' : 'text-purple-light'"
                class="absolute inset-y-0 right-0 flex items-center pr-1 pointer-events-none"
            >
                <svg
                    class="w-2.5 h-2.5"
                    width="9"
                    height="6"
                    viewBox="0 0 9 6"
                    fill="currentColor"
                    xmlns="http://www.w3.org/2000/svg"
                >
                    <path
                        d="M4.45879 5.6777L0.561677 0.4277L8.35591 0.4277L4.45879 5.6777Z"
                    />
                </svg>
            </div>
        </button>
        <transition
            enter-active-class="transition duration-100 ease-out"
            enter-from-class="transform scale-95 opacity-0"
            enter-to-class="transform scale-100 opacity-100"
            leave-active-class="transition duration-75 ease-in"
            leave-from-class="transform scale-100 opacity-100"
            leave-to-class="transform scale-95 opacity-0"
        >
            <div
                class="absolute z-30 rounded shadow top-7 right-0"
                v-show="showDropdown"
            >
                <div
                    class="absolute text-gray-300 transform rotate-180 -top-2 right-1"
                >
                    <svg
                        class="w-2.5 h-2.5"
                        width="9"
                        height="6"
                        viewBox="0 0 9 6"
                        fill="currentColor"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M4.45879 5.6777L0.561677 0.4277L8.35591 0.4277L4.45879 5.6777Z"
                        />
                    </svg>
                </div>
                <slot>
                    <ul
                        class="box-border bg-gray-200 border border-gray-300 rounded text-2xs -right-10"
                    >
                        <li
                            v-for="(val, id) of options"
                            class="px-1 border rounded cursor-pointer hover:border-purple-light"
                            :key="id"
                            role="option"
                            @click="setPriority(val, index)"
                        >
                            {{ val }}
                        </li>
                    </ul>
                </slot>
            </div>
        </transition>
    </div>
</template>

<script>
export default {
    name: 'button-dropdown',
    props: {
        index: {
            type: Number,
            default: 0,
        },
        value: {
            type: String,
            default: 'Value',
        },
        disabled: {
            type: Boolean,
            default: false,
        },
        isValid: {
            type: Boolean,
            default: true,
        },
    },
    data() {
        return {
            showDropdown: false,
            options: ['Optional', 'Mandatory'],
        }
    },
    emits: ['show-dropdown'],
    methods: {
        inputClass(index) {
            return {
                'border-red-700': !this.isValid,
            }
        },
        setPriority() {
            console.log('setPriority', arguments)
        },
        closeDropdown() {
            this.showDropdown = null
            this.$emit('show-dropdown', false)
        },
        openDropdown() {
            this.showDropdown = !this.showDropdown
            this.$emit('show-dropdown', true)
            // this.showDropdown = this.showDropdown !== this.index ? this.index : null
        },
    },
}
</script>
