Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9020A18A
	for <lists+cocci@lfdr.de>; Thu, 25 Jun 2020 17:06:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05PF62gb025793;
	Thu, 25 Jun 2020 17:06:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5F97C7831;
	Thu, 25 Jun 2020 17:06:01 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 0B5E93BAB
 for <cocci@systeme.lip6.fr>; Mon, 22 Jun 2020 18:14:38 +0200 (CEST)
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:241])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05MGEalE017505
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 22 Jun 2020 18:14:37 +0200 (CEST)
Received: by mail-oi1-x241.google.com with SMTP id 25so16082420oiy.13
 for <cocci@systeme.lip6.fr>; Mon, 22 Jun 2020 09:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VVaCcZG58WyWvPJ2lYOGRecBDq8B1jl/4gBvyhUrQn8=;
 b=hjOqsA1J9Nge6aShoubXb7xlmkqcvD0u8sQ/uIBCrC8e0bV/fPKVmzQKXoxiz+uH8G
 7zaQSSlnpNs4/FKAMUbEFx657gJcZzY8dAVSe7rNcGm1tEoKepIA1gNYRSHak7eU5pAR
 4AR1Bq0GeXrG+kCCO+BaDcpqAhMClQ+vJiEU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VVaCcZG58WyWvPJ2lYOGRecBDq8B1jl/4gBvyhUrQn8=;
 b=nwVX/TRMrBJiv/B7oFqARZ7DhJctjS+gEkIcIA5Y+LcGxhqDQ/aHfdoIaTMZxgojL+
 WjI1E0g7cxBZUl4eif3HbLB/EybrMOOYSO5f/J9sBlnW20RLUd+7sAUn5QhsnlqMcaNS
 /gnqvMUEv64TyYZMOegHn+HxY2ie/BuFzS81XTv9MA1zeAJzA4VBr31GX5rIwZQ0LaoW
 EQ2eNlV14Nyd99i4hrYNJkDnlq5M+sFdcdGqsr5zuWyBxF7VUZtKLnCk7AYeE2xfoUR+
 CRnwj/tspffIqUqFXe40p9AdZhrwfBXk3jgln5rpA5vAA0LRSjyxeoA8Gf4iqWThbr2H
 Rghw==
X-Gm-Message-State: AOAM533VpZigswVdn7/wTXvdeqmi/IaikXUpICR6Pd9dnE6HvxYlntIj
 xaxPFJCwGIjtU9FWlsrz6gEvAt/4Xt0=
X-Google-Smtp-Source: ABdhPJzm8MU3zV30ZHzDJEy4NbsU5cQabBWx/boBq5HyQvshlDpCIao3+byLMx0/z0YzJ18pFAP0XA==
X-Received: by 2002:aca:6008:: with SMTP id u8mr13575129oib.58.1592842475938; 
 Mon, 22 Jun 2020 09:14:35 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id 35sm3365700otd.68.2020.06.22.09.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 09:14:35 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200604164145.173925-1-maennich@google.com>
 <alpine.DEB.2.21.2006042130080.2577@hadrien>
 <bf757b9d-6a67-598b-ed6e-7ee24464abfa@linuxfoundation.org>
 <20200622080345.GD260206@google.com>
 <0eda607e-4083-46d2-acb8-63cfa2697a71@linuxfoundation.org>
 <20200622150605.GA3828014@kroah.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f09e32dc-8f17-d09a-b2e4-fb4c0699838e@linuxfoundation.org>
Date: Mon, 22 Jun 2020 10:14:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622150605.GA3828014@kroah.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 25 Jun 2020 17:06:02 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 22 Jun 2020 18:14:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Thu, 25 Jun 2020 17:06:00 +0200
Cc: Matthias Maennich <maennich@google.com>, skhan@linuxfoundation.org,
        YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, jeyu@kernel.org, kernel-team@android.com,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] scripts: add dummy report mode to
	add_namespace.cocci
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

On 6/22/20 9:06 AM, Greg Kroah-Hartman wrote:
> On Mon, Jun 22, 2020 at 08:46:18AM -0600, Shuah Khan wrote:
>> On 6/22/20 2:03 AM, Matthias Maennich wrote:
>>> On Thu, Jun 04, 2020 at 02:39:18PM -0600, Shuah Khan wrote:
>>>> On 6/4/20 1:31 PM, Julia Lawall wrote:
>>>>>
>>>>>
>>>>> On Thu, 4 Jun 2020, Matthias Maennich wrote:
>>>>>
>>>>>> When running `make coccicheck` in report mode using the
>>>>>> add_namespace.cocci file, it will fail for files that contain
>>>>>> MODULE_LICENSE. Those match the replacement precondition, but spatch
>>>>>> errors out as virtual.ns is not set.
>>>>>>
>>>>>> In order to fix that, add the virtual rule nsdeps and only
>>>>>> do search and
>>>>>> replace if that rule has been explicitly requested.
>>>>>>
>>>>>> In order to make spatch happy in report mode, we also need a
>>>>>> dummy rule,
>>>>>> as otherwise it errors out with "No rules apply". Using a script:python
>>>>>> rule appears unrelated and odd, but this is the shortest I
>>>>>> could come up
>>>>>> with.
>>>>>>
>>>>>> Adjust scripts/nsdeps accordingly to set the nsdeps rule
>>>>>> when run trough
>>>>>> `make nsdeps`.
>>>>>>
>>>>>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>>>>>> Fixes: c7c4e29fb5a4 ("scripts: add_namespace: Fix coccicheck failed")
>>>>>> Cc: YueHaibing <yuehaibing@huawei.com>
>>>>>> Cc: jeyu@kernel.org
>>>>>> Cc: cocci@systeme.lip6.fr
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Signed-off-by: Matthias Maennich <maennich@google.com>
>>>>>
>>>>> Acked-by: Julia Lawall <julia.lawall@inria.fr>
>>>>>
>>>>> Shuah reported the problem to me, so you could add
>>>>>
>>>>> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>>
>>>>
>>>> Very cool. No errors with this patch. Thanks for fixing it
>>>> quickly.
>>>
>>> I am happy I could fix that and thanks for confirming. I assume your
>>> Tested-by could be added?
>>
>> Yes
>>
>> Tested-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> Is somebody willing to take this patch through their tree?
>>>
>>
>> My guess is that these go through kbuild git??
> 
> If you want to take this, that's fine with me.  But as I had the
> original file come through my tree, I can take it too.  It's up to you,
> either is ok with me.
> 

Great. Please take this through your tree.

thanks,
-- Shuah
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
