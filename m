Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D313D66E
	for <lists+cocci@lfdr.de>; Thu, 16 Jan 2020 10:10:03 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00G99QtK016314;
	Thu, 16 Jan 2020 10:09:26 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E967577F7;
	Thu, 16 Jan 2020 10:09:25 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CAE38771F
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 10:09:23 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00G99JWP027511
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 10:09:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,325,1574118000"; d="scan'208";a="336003053"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 10:09:19 +0100
Date: Thu, 16 Jan 2020 10:09:18 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001161008460.2825@hadrien>
References: <20200116051843.3328-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 10:09:28 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 10:09:19 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] parsing_c: Add space for tokens after *
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



On Thu, 16 Jan 2020, Jaskaran Singh wrote:

> In certain cases, there is no space added after the Pointer type.
> Examples of such cases are * const, * __attr and * const *.
>
> In the Pointer case of pp_type_with_ident_rest and pp_type_left, if
> the * is followed by anything within the type, add a space after the
> printing.

Thank for the patch.  Could you add in a test case as well?

thanks,
julia


>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_c/pretty_print_c.ml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
> index ccf8214d..a2e35588 100644
> --- a/parsing_c/pretty_print_c.ml
> +++ b/parsing_c/pretty_print_c.ml
> @@ -806,6 +806,8 @@ and pp_string_format (e,ii) =
>            (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
>            pr_elem i;
>            iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          if iiqu <> [] || get_comments_after i <> []
> +          then pr_space();
>            pp_type_with_ident_rest ident t attrs Ast_c.noattr;
>
>        (* ugly special case ... todo? maybe sufficient in practice *)
> @@ -885,6 +887,8 @@ and pp_string_format (e,ii) =
>        | (Pointer t, [i]) ->
>            pr_elem i;
>            iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
> +          if iiqu <> [] || get_comments_after i <> []
> +          then pr_space();
>            pp_type_left t
>
>        | (Array (eopt, t), [i1;i2]) -> pp_type_left t
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
