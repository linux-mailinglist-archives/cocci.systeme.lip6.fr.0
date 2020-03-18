Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4789C18A28C
	for <lists+cocci@lfdr.de>; Wed, 18 Mar 2020 19:43:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02IIhHEj002901;
	Wed, 18 Mar 2020 19:43:17 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3C3E0781F;
	Wed, 18 Mar 2020 19:43:17 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 14CCF77F9
 for <cocci@systeme.lip6.fr>; Wed, 18 Mar 2020 19:43:15 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02IIhEvO017983
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 18 Mar 2020 19:43:14 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,568,1574118000"; d="scan'208";a="441036846"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 19:43:14 +0100
Date: Wed, 18 Mar 2020 19:43:14 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200316100319.27935-16-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2003181942250.2979@hadrien>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
 <20200316100319.27935-16-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 18 Mar 2020 19:43:17 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 18 Mar 2020 19:43:14 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 15/26] parsing_cocci: compute_lines: Add cases
 for ParenType/FunctionType
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



On Mon, 16 Mar 2020, Jaskaran Singh wrote:

> ParenType and FunctionType are now added to the SmPL ASTs. Add
> cases for these types in compute_lines.ml.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_cocci/compute_lines.ml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
> index f4b6f4d8..8231a0e7 100644
> --- a/parsing_cocci/compute_lines.ml
> +++ b/parsing_cocci/compute_lines.ml
> @@ -574,6 +574,17 @@ and typeC t =
>        let rp2 = normal_mcode rp2 in
>        mkres t (Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2))
>  	ty (promote_mcode rp2)
> +  | Ast0.ParenType(lp,ty,rp) ->
> +      let lp = normal_mcode lp in
> +      let rp = normal_mcode rp in
> +      let ty = typeC ty in
> +      mkres t (Ast0.ParenType(lp,ty,rp)) ty (promote_mcode rp)

The type is not the leftmost thing.  So the third argument should be
(promote_mcode lp).

julia

> +  | Ast0.FunctionType(ty,lp,params,rp) ->
> +      let ty = typeC ty in
> +      let lp = normal_mcode lp in
> +      let params = parameter_list (Some(promote_mcode lp)) params in
> +      let rp = normal_mcode rp in
> +      mkres t (Ast0.FunctionType(ty,lp,params,rp)) ty (promote_mcode rp)
>    | Ast0.Array(ty,lb,size,rb) ->
>        let ty = typeC ty in
>        let lb = normal_mcode lb in
> --
> 2.21.1
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
