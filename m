Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C79FF486
	for <lists+cocci@lfdr.de>; Sat, 16 Nov 2019 18:58:13 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAGHvhcF026373;
	Sat, 16 Nov 2019 18:57:43 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DB56F77DD;
	Sat, 16 Nov 2019 18:57:42 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4800377C6
 for <cocci@systeme.lip6.fr>; Sat, 16 Nov 2019 18:57:40 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAGHvdqB020109
 for <cocci@systeme.lip6.fr>; Sat, 16 Nov 2019 18:57:39 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,313,1569276000"; d="scan'208";a="326964230"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Nov 2019 18:57:39 +0100
Date: Sat, 16 Nov 2019 18:57:38 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <6fffd13a-738b-e750-9f5a-f0bfb252855b@web.de>
Message-ID: <alpine.DEB.2.21.1911161855400.3558@hadrien>
References: <50c77cdc-2b2d-16c8-b413-5eb6a2bae749@web.de>
 <5189f847-1af1-f050-6c72-576a977f6f12@web.de>
 <xmqqa790cyp1.fsf@gitster-ct.c.googlers.com>
 <fe9b8c08-6fd4-d378-f3ff-8170381b10e0@web.de>
 <xmqqr22b9ptk.fsf@gitster-ct.c.googlers.com>
 <ba5d609a-16ea-d7e9-66e6-19aab94b2acd@web.de>
 <53346d52-e096-c651-f70a-ce6ca4d82ff9@web.de>
 <6c4ef61f-5fef-ffc8-82d6-ee42006756b4@web.de>
 <aed296a6-bae0-6fcc-515e-ef96fed24ca6@web.de>
 <6fffd13a-738b-e750-9f5a-f0bfb252855b@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2018444975-1573927059=:3558"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 16 Nov 2019 18:57:46 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sat, 16 Nov 2019 18:57:39 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: git@vger.kernel.org, Junio C Hamano <gitster@pobox.com>,
        Coccinelle <cocci@systeme.lip6.fr>,
        =?ISO-8859-15?Q?Ren=E9_Scharfe?= <l.s.r@web.de>
Subject: Re: [Cocci] git-coccinelle: adjustments for array.cocci?
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2018444975-1573927059=:3558
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 15 Nov 2019, Markus Elfring wrote:

> > Anyway, someone who can reproduce the issue using the latest release
> > of Coccinelle would be in a better position to file a bug report.
>
> Hello,
>
> I repeated the discussed source code transformation approach together
> with the software combination “Coccinelle 1.0.8-00004-g842075f7” (OCaml 4.09).
> https://github.com/coccinelle/coccinelle/commits/master
>
> 1. Yesterday I checked the source files out for the software “Git”
>    according to the commit “The first batch post 2.24 cycle”.
>    https://github.com/git/git/commit/d9f6f3b6195a0ca35642561e530798ad1469bd41
>
> 2. I restored a previous development status by the following command.
>
>    git show 921d49be86 | patch -p1 -R
>
>    See also:
>    https://public-inbox.org/git/53346d52-e096-c651-f70a-ce6ca4d82ff9@web.de/
>
> 3. I stored a generated patch based on the currently released SmPL script.
>    https://github.com/git/git/blob/177fbab747da4f58cb2a8ce010b3515c86dd67c9/contrib/coccinelle/array.cocci
>
> 4. I applied the following patch then.
>
> diff --git a/contrib/coccinelle/array.cocci b/contrib/coccinelle/array.cocci
> index 46b8d2ee11..89df184bbd 100644
> --- a/contrib/coccinelle/array.cocci
> +++ b/contrib/coccinelle/array.cocci
> @@ -12,27 +12,21 @@ T *ptr;
>  T[] arr;
>  expression E, n;
>  @@
> -(
> -  memcpy(ptr, E,
> -- n * sizeof(*(ptr))
> -+ n * sizeof(T)
> -  )
> -|
> -  memcpy(arr, E,
> -- n * sizeof(*(arr))
> -+ n * sizeof(T)
> -  )
> -|
> -  memcpy(E, ptr,
> -- n * sizeof(*(ptr))
> -+ n * sizeof(T)
> -  )
> -|
> -  memcpy(E, arr,
> -- n * sizeof(*(arr))
> -+ n * sizeof(T)
> -  )
> + memcpy(
> +(       ptr, E, n *
> +-       sizeof(*(ptr))
> ++       sizeof(T)
> +|       arr, E, n *
> +-       sizeof(*(arr))
> ++       sizeof(T)
> +|       E, ptr, n *
> +-       sizeof(*(ptr))
> ++       sizeof(T)
> +|       E, arr, n *
> +-       sizeof(*(arr))
> ++       sizeof(T)
>  )
> +       )

This seems quite unreadable, in contrast to the original code.

>
>  @@
>  type T;
>
>    I suggested in this way to move a bit of SmPL code.
>
> 5. I stored another generated patch based on the adjusted SmPL script.

No idea what it means to store a patch.

> 6. I performed a corresponding file comparison.
>
> --- array-released.diff	2019-11-14 21:29:11.020576916 +0100
> +++ array-reduced1.diff	2019-11-14 21:45:58.931956527 +0100
> @@ -6,24 +6,10 @@
>   	r->entry_count = t->entry_count;
>   	r->delta_depth = t->delta_depth;
>  -	memcpy(r->entries,t->entries,t->entry_count*sizeof(t->entries[0]));
> -+	COPY_ARRAY(r->entries, t->entries, t->entry_count);
> ++	memcpy(r->entries,t->entries,t->entry_count*sizeof(*(t->entries)));
>   	release_tree_content(t);
>   	return r;
>   }

I have no idea what is being compared here. The COPY_ARRAY thing looks
nice, but doesn't seem to have anything to do with your semantic patch.

julia



> -diff -u -p a/pretty.c b/pretty.c
> ---- a/pretty.c
> -+++ b/pretty.c
> -@@ -106,8 +106,8 @@ static void setup_commit_formats(void)
> - 	commit_formats_len = ARRAY_SIZE(builtin_formats);
> - 	builtin_formats_len = commit_formats_len;
> - 	ALLOC_GROW(commit_formats, commit_formats_len, commit_formats_alloc);
> --	memcpy(commit_formats, builtin_formats,
> --	       sizeof(*builtin_formats)*ARRAY_SIZE(builtin_formats));
> -+	COPY_ARRAY(commit_formats, builtin_formats,
> -+		   ARRAY_SIZE(builtin_formats));
> -
> - 	git_config(git_pretty_formats_config, NULL);
> - }
>  diff -u -p a/packfile.c b/packfile.c
>  --- a/packfile.c
>  +++ b/packfile.c
> @@ -36,17 +22,6 @@
>   		} else {
>   			ALLOC_GROW(poi_stack, poi_stack_nr+1, poi_stack_alloc);
>   		}
> -@@ -1698,8 +1698,8 @@ void *unpack_entry(struct repository *r,
> - 		    && delta_stack == small_delta_stack) {
> - 			delta_stack_alloc = alloc_nr(delta_stack_nr);
> - 			ALLOC_ARRAY(delta_stack, delta_stack_alloc);
> --			memcpy(delta_stack, small_delta_stack,
> --			       sizeof(*delta_stack)*delta_stack_nr);
> -+			COPY_ARRAY(delta_stack, small_delta_stack,
> -+				   delta_stack_nr);
> - 		} else {
> - 			ALLOC_GROW(delta_stack, delta_stack_nr+1, delta_stack_alloc);
> - 		}
>  diff -u -p a/compat/regex/regexec.c b/compat/regex/regexec.c
>  --- a/compat/regex/regexec.c
>  +++ b/compat/regex/regexec.c
>
>
> How do you think about the differences from this test result?
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-2018444975-1573927059=:3558
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-2018444975-1573927059=:3558--
