Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E25C10E4
	for <lists+cocci@lfdr.de>; Sat, 28 Sep 2019 14:44:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8SCi6R1022821;
	Sat, 28 Sep 2019 14:44:06 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5025B77B8;
	Sat, 28 Sep 2019 14:44:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C735C77A2
 for <cocci@systeme.lip6.fr>; Sat, 28 Sep 2019 14:44:03 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8SCi1mo017996
 for <cocci@systeme.lip6.fr>; Sat, 28 Sep 2019 14:44:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,559,1559512800"; d="scan'208";a="320939417"
Received: from unknown (HELO hadrien) ([12.206.46.62])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Sep 2019 14:43:59 +0200
Date: Sat, 28 Sep 2019 05:43:57 -0700 (PDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190928094245.45696-1-yuehaibing@huawei.com>
Message-ID: <alpine.DEB.2.21.1909280542490.2168@hadrien>
References: <20190928094245.45696-1-yuehaibing@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 28 Sep 2019 14:44:07 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sat, 28 Sep 2019 14:44:01 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: michal.lkml@markovi.net, nicolas.palix@imag.fr, maennich@google.com,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [RFC PATCH] scripts: Fix coccicheck failed
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



On Sat, 28 Sep 2019, YueHaibing wrote:

> Run make coccicheck, I got this:
>
> spatch -D patch --no-show-diff --very-quiet --cocci-file
>  ./scripts/coccinelle/misc/add_namespace.cocci --dir .
>  -I ./arch/x86/include -I ./arch/x86/include/generated
>  -I ./include -I ./arch/x86/include/uapi
>  -I ./arch/x86/include/generated/uapi -I ./include/uapi
>  -I ./include/generated/uapi --include ./include/linux/kconfig.h
>  --jobs 192 --chunksize 1
>
> virtual rule patch not supported
> coccicheck failed
>
> It seems add_namespace.cocci cannot be called in coccicheck.

Could you explain the issue better?  Does the current state cause make
coccicheck to fail?  Or is it just silently not being called?

thanks,
julia

>
> Fixes: eb8305aecb95 ("scripts: Coccinelle script for namespace dependencies.")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  scripts/{coccinelle/misc => }/add_namespace.cocci | 0
>  scripts/nsdeps                                    | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename scripts/{coccinelle/misc => }/add_namespace.cocci (100%)
>
> diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/add_namespace.cocci
> similarity index 100%
> rename from scripts/coccinelle/misc/add_namespace.cocci
> rename to scripts/add_namespace.cocci
> diff --git a/scripts/nsdeps b/scripts/nsdeps
> index ac2b6031dd13..0f743b76e501 100644
> --- a/scripts/nsdeps
> +++ b/scripts/nsdeps
> @@ -23,7 +23,7 @@ fi
>
>  generate_deps_for_ns() {
>  	$SPATCH --very-quiet --in-place --sp-file \
> -		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
> +		$srctree/scripts/add_namespace.cocci -D ns=$1 $2
>  }
>
>  generate_deps() {
> --
> 2.20.1
>
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
