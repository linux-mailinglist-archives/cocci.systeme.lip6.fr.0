Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1F291FBC
	for <lists+cocci@lfdr.de>; Sun, 18 Oct 2020 22:15:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09IKFWWq017168;
	Sun, 18 Oct 2020 22:15:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 23FD97797;
	Sun, 18 Oct 2020 22:15:32 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E03B874CE
 for <cocci@systeme.lip6.fr>; Sun, 18 Oct 2020 22:07:54 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09IK7rM1017220
 for <cocci@systeme.lip6.fr>; Sun, 18 Oct 2020 22:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603051673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NTLZYWawMA/L7zMDVfD3OfVMnCwMIaw3VHURN6LV+Y0=;
 b=KeiQwrW9sPfr+vR6uMFXkyS2kaqOocIRRR+FWQlSwyfTkQXxjiPahAzVW1ddnTIJ+gsEiG
 7JlOsTK0WYxPs0HsZtFCA4ptTn3Ti7MJM5yMW5puegDD8Nv8p5F43mFpt6c88Q4nYR7dIF
 uDfZmDlKk4T9UueSRtetz4GmOrcJ1Ww=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-Dclq17YnOz6JvcOuTVzdDQ-1; Sun, 18 Oct 2020 16:07:51 -0400
X-MC-Unique: Dclq17YnOz6JvcOuTVzdDQ-1
Received: by mail-qk1-f199.google.com with SMTP id m126so5933431qkd.13
 for <cocci@systeme.lip6.fr>; Sun, 18 Oct 2020 13:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NTLZYWawMA/L7zMDVfD3OfVMnCwMIaw3VHURN6LV+Y0=;
 b=M9pcpn+rn12YtJfcAFFWq5z6tKyO4PLMUGwm6qytS1+pyUy+QQM5tdbQa4iYHrMiYS
 rvtR55E3tzmNiOOwgbyp+n3SCbOt86IwsDHMfrlfCU7AI7sJpzSs9N/Lh4O0uzW7Jpw3
 oWfhIdRFBdHV+3mVXtvUW4QG7XxFkB5JZQ7722ceLg9Tes/ejf3OvSG9uGdfusanTOba
 QDMRQvB+T3EdHYsEMl2rNxK9QdxvUEhvpGaheQU3V8inD5NkRZ6BTmvlHO+Dm2WjmKoA
 6kQTgjjjApku+RJ8k6Nk5eOfQ0TxfqwWbL0vPptwbbU9+Kd6LgicktoFKc5dh3ijp+pu
 2lEg==
X-Gm-Message-State: AOAM530kd+BqDryn8O9yMidfTqG6h7EzPt5Y5Bvr5oHz4yFMWSJaX6jR
 1E1YhYG6FUwPCFgyy9P5HmGs2U421TSkj+PnU739Oiqid0cE1/9MISqLYotrOnLC5fRA4OvEl29
 +gHBRcPQh3mq2JhI=
X-Received: by 2002:a05:620a:2018:: with SMTP id
 c24mr13315169qka.154.1603051670699; 
 Sun, 18 Oct 2020 13:07:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOPFqVFv2ElM0J+6h4M5OMFvrz9WjHO0/gGrsguFVm71lDcwnpUchKmvulX5ZULsK/1q+uCQ==
X-Received: by 2002:a05:620a:2018:: with SMTP id
 c24mr13315160qka.154.1603051670423; 
 Sun, 18 Oct 2020 13:07:50 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 29sm3462782qks.28.2020.10.18.13.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2020 13:07:49 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20201017160928.12698-1-trix@redhat.com>
 <f530b7aeecbbf9654b4540cfa20023a4c2a11889.camel@perches.com>
 <alpine.DEB.2.22.394.2010172016370.9440@hadrien>
 <dfe24da760056e31d90ff639b47c494263b5f4a7.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <a15ada1f-9bad-612e-e841-934bff088f38@redhat.com>
Date: Sun, 18 Oct 2020 13:07:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <dfe24da760056e31d90ff639b47c494263b5f4a7.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 18 Oct 2020 22:15:32 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 18 Oct 2020 22:07:54 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sun, 18 Oct 2020 22:15:29 +0200
Cc: linux-kernel@vger.kernel.org, cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] checkpatch: Allow --fix removal of unnecessary
 break statements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

I like!

On 10/18/20 12:49 PM, Joe Perches wrote:
> switch/case use of break after a return or goto is unnecessary.
>
> There is an existing warning for these uses, so add a --fix option too.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>
> For today's next, this would remove ~300 instances like:
>
> 	case FOO:
> 		return bar;
> 		break;
> or
> 	case FOO:
> 		goto bar;
> 		break;
>
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..22263b278e87 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3678,8 +3678,11 @@ sub process {
>  		if ($sline =~ /^\+([\t]+)break\s*;\s*$/) {
>  			my $tabs = $1;
>  			if ($prevline =~ /^\+$tabs(?:goto|return)\b/) {

could add a '|break' here to catch the couple

break;

break;

Reviewed-by: Tom Rix <trix@redhat.com>

> -				WARN("UNNECESSARY_BREAK",
> -				     "break is not useful after a goto or return\n" . $hereprev);
> +				if (WARN("UNNECESSARY_BREAK",
> +					 "break is not useful after a goto or return\n" . $hereprev) &&
> +				    $fix) {
> +					fix_delete_line($fixlinenr, $rawline);
> +				}
>  			}
>  		}
>  
>
>

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
