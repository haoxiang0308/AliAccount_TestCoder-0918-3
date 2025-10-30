#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * APlayerInputHandler class handles player input in Unreal Engine
 */
UCLASS()
class APlayerInputHandler : public APlayerController
{
    GENERATED_BODY()

public:
    APlayerInputHandler();

    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called to bind functionality to input
    virtual void SetupInputComponent() override;

protected:
    // Input functions
    void MoveForward(float Value);
    void MoveRight(float Value);
    void LookUp(float Value);
    void Turn(float Value);
    void Jump();
    void Fire();

private:
    // Input mapping context and action bindings
    UPROPERTY()
    class UInputMappingContext* DefaultMappingContext;

    UPROPERTY()
    class UInputAction* MoveForwardAction;

    UPROPERTY()
    class UInputAction* MoveRightAction;

    UPROPERTY()
    class UInputAction* LookUpAction;

    UPROPERTY()
    class UInputAction* TurnAction;

    UPROPERTY()
    class UInputAction* JumpAction;

    UPROPERTY()
    class UInputAction* FireAction;
};