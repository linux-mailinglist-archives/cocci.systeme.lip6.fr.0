Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB81BAA9B
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 19:01:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RH0XDx001379;
	Mon, 27 Apr 2020 19:00:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1A0C5782D;
	Mon, 27 Apr 2020 19:00:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 76B837769
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:00:30 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RH0TLN003307
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 19:00:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,324,1583190000"; d="scan'208";a="347097522"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 19:00:22 +0200
Date: Mon, 27 Apr 2020 19:00:22 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200427120834.380-6-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2004271859580.12657@hadrien>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
 <20200427120834.380-6-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:00:34 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 19:00:30 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 05/23] parsing_cocci: check_meta: Reflect
 Parameter attributes
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



On Mon, 27 Apr 2020, Jaskaran Singh wrote:

> Parameter attributes are added to the SmPL AST. Reflect these changes in
> check_meta.ml.

Maybe add a comment that for the moment there are no metavariables for
attributes.

julia

>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/check_meta.ml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
> index 5a348ba3..ab1d357e 100644
> --- a/parsing_cocci/check_meta.ml
> +++ b/parsing_cocci/check_meta.ml
> @@ -374,7 +374,7 @@ and initialiser_list old_metas table minus =
>
>  and parameterTypeDef old_metas table minus param =
>    match Ast0.unwrap param with
> -    Ast0.Param(ty,id) ->
> +    Ast0.Param(ty,id,attr) ->
>        get_opt (ident ID old_metas table minus) id;
>        typeC old_metas table minus ty
>    | Ast0.MetaParam(name,_,_) ->
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
