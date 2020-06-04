Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F381EEC3F
	for <lists+cocci@lfdr.de>; Thu,  4 Jun 2020 22:42:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 054KfoKH027325;
	Thu, 4 Jun 2020 22:41:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 70B8A782F;
	Thu,  4 Jun 2020 22:41:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 645095D47
 for <cocci@systeme.lip6.fr>; Thu,  4 Jun 2020 22:39:22 +0200 (CEST)
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:341])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 054KdKpt003047
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 4 Jun 2020 22:39:21 +0200 (CEST)
Received: by mail-ot1-x341.google.com with SMTP id v17so5884144ote.0
 for <cocci@systeme.lip6.fr>; Thu, 04 Jun 2020 13:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4qcFbrYrQboDsoGvWR4IKKjkBw2HOoEx50CuF4/sRg=;
 b=X+1urrchhlAJ6Ly5eKLEwlLZBlos/tPMbW2qcDX2ccbNN0J0XQByplLqMfeDaRcNHQ
 EvnZLIGtALIexNJWE7WZhaFK5yQsyRt8/i1DxNLSpK+1LzHPWpUKOETN1BYjFdCjB+Vl
 /AP5kdUUtAL9HKi1PmPBX5OXwcuOL94Gi6dhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4qcFbrYrQboDsoGvWR4IKKjkBw2HOoEx50CuF4/sRg=;
 b=mJhl2EX5OHr+IoVmB6iu8e3ClC5jn+a5bIy6NLtUiuVxOZ2rix21gP2pynpPoN15kk
 yOffF5S7xx4DFIyRXU0ijtqLTmQNj9z3UlbdVIUosWnvYywSh6cJMZvj+qjFt+9I0u85
 7uBIluU+Gz5bXCWwlcmO7Kov23VdCVRsauSKUrMcbxoKDF1zFgGOt/9NpD7FPavT6nhs
 GCs2pAkhcWCCZOMjbmNJYyteSQlPxhwOGcZ/zVk1hQtkgsXqqvc+3jtrdW0XF4Z6ud3x
 wD9KnE7iuiZzks8UaMrqS/fcU3R+2d+zrZewUFaBBLFtZcGz4PSqZhFCFUWj5Oqo+r8H
 M0aQ==
X-Gm-Message-State: AOAM532RCtNjlQ8/6iThAG3VvF7Q1BIslr7Lf4z6tPjDcH6V3VVFlrfp
 r0A1CEJToWk2D9rLi7Ww7B0d5Q==
X-Google-Smtp-Source: ABdhPJy7AdFjBepNhW8xq/grKYoy25Pw+/agwirtqSpnQR9W3AmaDRAKSPoazBhBoL3dX678SmP4sw==
X-Received: by 2002:a9d:7f8c:: with SMTP id t12mr2603935otp.66.1591303160057; 
 Thu, 04 Jun 2020 13:39:20 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id f2sm1527259otc.45.2020.06.04.13.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:39:19 -0700 (PDT)
To: Julia Lawall <julia.lawall@inria.fr>,
        Matthias Maennich <maennich@google.com>
References: <20200604164145.173925-1-maennich@google.com>
 <alpine.DEB.2.21.2006042130080.2577@hadrien>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <bf757b9d-6a67-598b-ed6e-7ee24464abfa@linuxfoundation.org>
Date: Thu, 4 Jun 2020 14:39:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006042130080.2577@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 22:41:51 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 04 Jun 2020 22:39:21 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Thu, 04 Jun 2020 22:41:48 +0200
Cc: Shuah Khan <skhan@linuxfoundation.org>, YueHaibing <yuehaibing@huawei.com>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org, jeyu@kernel.org,
        kernel-team@android.com, cocci@systeme.lip6.fr
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

On 6/4/20 1:31 PM, Julia Lawall wrote:
> 
> 
> On Thu, 4 Jun 2020, Matthias Maennich wrote:
> 
>> When running `make coccicheck` in report mode using the
>> add_namespace.cocci file, it will fail for files that contain
>> MODULE_LICENSE. Those match the replacement precondition, but spatch
>> errors out as virtual.ns is not set.
>>
>> In order to fix that, add the virtual rule nsdeps and only do search and
>> replace if that rule has been explicitly requested.
>>
>> In order to make spatch happy in report mode, we also need a dummy rule,
>> as otherwise it errors out with "No rules apply". Using a script:python
>> rule appears unrelated and odd, but this is the shortest I could come up
>> with.
>>
>> Adjust scripts/nsdeps accordingly to set the nsdeps rule when run trough
>> `make nsdeps`.
>>
>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>> Fixes: c7c4e29fb5a4 ("scripts: add_namespace: Fix coccicheck failed")
>> Cc: YueHaibing <yuehaibing@huawei.com>
>> Cc: jeyu@kernel.org
>> Cc: cocci@systeme.lip6.fr
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Matthias Maennich <maennich@google.com>
> 
> Acked-by: Julia Lawall <julia.lawall@inria.fr>
> 
> Shuah reported the problem to me, so you could add
> 
> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
> 

Very cool. No errors with this patch. Thanks for fixing it
quickly.

thanks,
-- Shuah



_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
