#include "PlayerInputHandler.h"
#include "Components/InputComponent.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
    // Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;

    // Create a camera boom (pulls in towards the player if there is a collision)
    CameraBoom = CreateDefaultSubobject<USpringArmComponent>(TEXT("CameraBoom"));
    CameraBoom->SetupAttachment(RootComponent);
    CameraBoom->TargetArmLength = 300.0f; // The camera follows at this distance behind the character	
    CameraBoom->bUsePawnControlRotation = true; // Rotate the arm based on the controller

    // Create a follow camera
    FollowCamera = CreateDefaultSubobject<UCameraComponent>(TEXT("FollowCamera"));
    FollowCamera->SetupAttachment(CameraBoom, USpringArmComponent::SocketName); // Attach the camera to the end of the boom
    FollowCamera->bUsePawnControlRotation = false; // Camera does not rotate relative to arm
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Binding axis mappings
    PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
    PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
    PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
    PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
}

void APlayerInputHandler::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in the world direction the player is facing
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        // Add movement in the world direction the player is facing
        AddMovementInput(GetActorRightVector(), Value);
    }
}

void APlayerInputHandler::LookUp(float Value)
{
    if (Value != 0.0f)
    {
        // Look up/down based on the controller
        AddControllerPitchInput(Value);
    }
}

void APlayerInputHandler::Turn(float Value)
{
    if (Value != 0.0f)
    {
        // Turn based on the controller
        AddControllerYawInput(Value);
    }
}